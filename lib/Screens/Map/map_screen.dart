import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:seeker_app/Screens/Map/widgets/map_header.dart';
import 'package:seeker_app/models/place_location.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;
  const MapScreen({
    Key key,
    this.initialLocation =
        const PlaceLocation(latitude: 37.422, longitude: -122.084),
    this.isSelecting = false,
  }) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _pickedLocation;
  LatLng _cameraLocation;
  Completer<GoogleMapController> _mapController = Completer();
  bool _isLoading = true;

  void _selectPlace(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  Future<void> setUserLocation() async {
    print('setuserlocation');
    final locData = await Location().getLocation();
    setState(() {
      _cameraLocation = LatLng(locData.latitude, locData.longitude);
    });
  }

  void setCameraPosition() async {
    await setUserLocation();
    final controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _cameraLocation,
          zoom: 16,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.isSelecting) {
      setUserLocation();
    } else {
      _cameraLocation = LatLng(
        widget.initialLocation.latitude,
        widget.initialLocation.longitude,
      );
    }
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AnimatedOpacity(
        opacity: _pickedLocation != null ? 1.0 : 0,
        duration: Duration(milliseconds: 300),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop(_pickedLocation);
          },
          child: Icon(
            Icons.check,
            size: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            if (_cameraLocation == null && _isLoading)
              Center(
                child: CircularProgressIndicator(),
              )
            else
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _cameraLocation,
                  zoom: 16,
                ),
                onTap: widget.isSelecting ? _selectPlace : null,
                markers: (_pickedLocation == null && widget.isSelecting)
                    ? null
                    : {
                        Marker(
                          markerId: MarkerId('m1'),
                          position: _pickedLocation ?? _cameraLocation,
                        )
                      },
                onMapCreated: (controller) {
                  _mapController.complete(controller);
                  setState(() {
                    _isLoading = true;
                  });
                },
              ),
            MapHeader(
              title: 'Última localización',
              child: IconButton(
                alignment: Alignment.centerRight,
                icon: Icon(
                  Icons.my_location,
                  color: Theme.of(context).accentColor.withOpacity(0.8),
                ),
                onPressed: setCameraPosition,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
