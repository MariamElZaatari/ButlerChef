import 'dart:convert';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/styles.dart';

class UploadRecipeImage extends StatefulWidget {
  final Function(String) callback;
  const UploadRecipeImage({Key? key, required this.callback}) : super(key: key);

  @override
  UploadRecipeImageState createState() => UploadRecipeImageState();
}

class UploadRecipeImageState extends State<UploadRecipeImage> {
  /// Variables
  File? imageFile;

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.green,
          title: const Text("Choose an Image", style: ThemeText.errorMessage),
        ),
        body: Container(
            child: imageFile == null
                ? Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          fixedSize:
                              MaterialStateProperty.all(const Size(321, 2)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50.0))),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(AppColors.green),
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused) ||
                                  states.contains(MaterialState.pressed)) {
                                return AppColors.white.withOpacity(0.12);
                              }
                              return null;
                            },
                          ),
                        ),
                        child: RichText(
                            text: const TextSpan(children: [
                          WidgetSpan(
                            child: FaIcon(FontAwesomeIcons.angleRight,
                                color: AppColors.white, size: 21),
                          ),
                          TextSpan(
                              text: " Open Gallery",
                              style: ThemeText.buttonText)
                        ])),
                        onPressed: () {
                          _getFromGallery();
                        },
                      ),
                    ),
                  )
                : SizedBox(
                    child: Stack(
                    children: [
                      Image.file(
                        imageFile!,
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            fixedSize:
                                MaterialStateProperty.all(const Size(321, 2)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0))),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.green),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.focused) ||
                                    states.contains(MaterialState.pressed)) {
                                  return AppColors.white.withOpacity(0.12);
                                }
                                return null;
                              },
                            ),
                          ),
                          child: RichText(
                              text: const TextSpan(children: [
                            WidgetSpan(
                              child: FaIcon(FontAwesomeIcons.check,
                                  color: AppColors.white, size: 21),
                            ),
                            TextSpan(text: " Done", style: ThemeText.buttonText)
                          ])),
                          onPressed: () async {
                            Uint8List imagebytes =
                                await imageFile!.readAsBytes();
                            String encode = base64.encode(imagebytes);
                            widget.callback(encode);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ))));
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}
