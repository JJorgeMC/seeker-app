import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seeker_app/Screens/Map/map_screen.dart';
import 'package:seeker_app/helpers/location_helper.dart';

class LocationInput extends StatefulWidget {
  final Function(double latitude, double longitude) onSelectPlace;
  const LocationInput({
    Key key,
    @required this.onSelectPlace,
  }) : super(key: key);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _selectLocation() async {
    final LatLng selectedLocation = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MapScreen(isSelecting: true),
      ),
    );
    if (selectedLocation == null) return;
    _showPreview(selectedLocation.latitude, selectedLocation.longitude);
    widget.onSelectPlace(
      selectedLocation.latitude,
      selectedLocation.longitude,
    );
  }

  void _showPreview(double lat, double lng) {
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
      latitude: lat,
      longitude: lng,
      height: 150,
      width: 600,
    );
    print(staticMapImageUrl);
    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF513B56).withOpacity(0.1),
            image: DecorationImage(
              image: AssetImage('assets/images/placeholder-image.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: _previewImageUrl == null
              ? null
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                ),
        ),
        FlatButton.icon(
          onPressed: _selectLocation,
          icon: Icon(
            Icons.add_location,
            color: Color(0xFF525174),
          ),
          label: Text('Agregar última localización'),
          textColor: Color(0xFF525174),
          splashColor: Color(0xFF525174).withOpacity(0.5),
        ),
      ],
    );
  }
}
