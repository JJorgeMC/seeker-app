import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seeker_app/Screens/EditDisappearance/widgets/box_button.dart';

class ImageInput extends StatefulWidget {
  final Function(List<File> images) onSelectImage;
  const ImageInput({
    Key key,
    @required this.onSelectImage,
  }) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  List<File> _pickedImages = [];

  Future<void> _takePicture(ImageSource source) async {
    final imageFile = await ImagePicker().getImage(
      source: source,
      maxWidth: 600,
    );
    if (imageFile == null) return;
    setState(() {
      _pickedImages.add(File(imageFile.path));
    });
    widget.onSelectImage(_pickedImages);
  }

  @override
  Widget build(BuildContext context) {
    final buttons = [
      BoxButton(
        press: () => _takePicture(ImageSource.gallery),
        iconData: Icons.add_photo_alternate,
        text: 'Agregar imagen',
      ),
      BoxButton(
        press: () => _takePicture(ImageSource.camera),
        iconData: Icons.add_a_photo,
        text: 'Tomar foto',
      ),
    ];
    return Container(
      height: 100,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 80,
            child: Swiper(
              loop: false,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return buttons[index];
              },
              itemCount: 2,
              pagination: SwiperPagination(
                margin: const EdgeInsets.only(bottom: 4),
                builder: DotSwiperPaginationBuilder(
                  color: Colors.black12,
                  activeColor: Theme.of(context).accentColor.withOpacity(0.8),
                ),
              ),
            ),
          ),
          Expanded(
            child: ReorderableListView(
              scrollDirection: Axis.horizontal,
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex == _pickedImages.length) newIndex--;

                  final image = _pickedImages.removeAt(oldIndex);

                  _pickedImages.insert(newIndex, image);
                });

                widget.onSelectImage(_pickedImages);
              },
              children: _pickedImages
                  .asMap()
                  .map(
                    (int index, File image) {
                      return MapEntry(
                        index,
                        buildImageItem(
                          image: image,
                          onDismissed: (DismissDirection value) {
                            setState(() {
                              _pickedImages.removeAt(index);
                            });
                            widget.onSelectImage(_pickedImages);
                          },
                        ),
                      );
                    },
                  )
                  .values
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImageItem({
    @required File image,
    @required Function(DismissDirection direction) onDismissed,
  }) {
    return Dismissible(
      key: ValueKey(image.path),
      background: Container(
        margin: const EdgeInsets.only(right: 10),
        alignment: Alignment.center,
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
      ),
      onDismissed: onDismissed,
      direction: DismissDirection.up,
      child: Container(
        height: 100,
        width: 105,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.15),
          image: DecorationImage(
            image: AssetImage(
              'assets/images/placeholder-square.png',
            ),
            fit: BoxFit.contain,
          ),
        ),
        child: Image.file(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
