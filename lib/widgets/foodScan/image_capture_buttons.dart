import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/quickalert.dart';
import 'package:sarah/widgets/foodInformation/food_information.dart';

class ImageCaptureButtons extends StatefulWidget {
  CameraController cameraController;

  ImageCaptureButtons({required this.cameraController});

  @override
  State<ImageCaptureButtons> createState() => _ImageCaptureButtonsState();
}

class _ImageCaptureButtonsState extends State<ImageCaptureButtons> {
  bool _isLoading = false;

  Future<String> processImage(XFile imageFile) async {
    String postUrl = "http://10.0.2.2:5000/classify_image";
    String base64StringFromImage = await imageTobase64String(imageFile);

    print('Sending request');
    setState(() {
      _isLoading = true;
      // widget.cameraController.dispose();
    });

    var request = http.MultipartRequest('POST', Uri.parse(postUrl));
    request.headers.addAll({'Content-Type': 'multipart/form-data'});
    request.fields['image_data'] = base64StringFromImage;

    IOClient client = IOClient();
    IOStreamedResponse response = await client.send(request);
    String foodName = await response.stream.bytesToString();
    // await Future.delayed(Duration(seconds: 10));

    setState(() {
      _isLoading = false;
    });
    if (response.statusCode == 200) {
      print('Success response : ' + foodName);
      return jsonDecode(foodName);
    } else {
      return '';
    }
  }

  void showSuccessAlert(String foodName) {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: foodName,
        confirmBtnText: 'Food Info',
        showCancelBtn: true,
        onConfirmBtnTap: (() {
          Navigator.of(context).pushNamed('/food-information',
              arguments: {'foodName': foodName});
        }));
  }

  void showFailedAlert() {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Unknown',
        text: 'Unable to recognize image');
  }

  Future<String> imageTobase64String(XFile imageFile) async {
    List<int> fileAsBytes = await imageFile.readAsBytes();
    return base64Encode(fileAsBytes);
  }

  void _processImageFromGallery() async {
    XFile imageFromGallery = await ImagePicker.platform
        .getImage(source: ImageSource.gallery) as XFile;
    String foodName = await processImage(imageFromGallery);
    _displayResponseAlerts(foodName);
  }

  void _processImageFromCamera() async {
    XFile imageFile = await widget.cameraController.takePicture();
    String foodName = await processImage(imageFile);
    _displayResponseAlerts(foodName);
  }

  void _displayResponseAlerts(String foodName) {
    if (foodName.isNotEmpty && foodName != 'unknown') {
      showSuccessAlert(foodName);
    } else {
      showFailedAlert();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
            iconSize: 50,
            onPressed: _processImageFromGallery,
            icon: Icon(Icons.photo_library_outlined)),
        SizedBox(
          width: 30,
        ),
        IconButton(
          icon: Image.asset('assets/images/image_capture_button.png'),
          onPressed: _processImageFromCamera,
          iconSize: 100,
        ),
        Center(
          child: _isLoading
              ? LinearProgressIndicator(
                  semanticsLabel: 'Processing',
                )
              : null,
        )
      ],
    );
  }
}
