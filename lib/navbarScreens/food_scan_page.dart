import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sarah/widgets/foodScan/food_scan_camera_preview.dart';

class FoodScanPage extends StatelessWidget {
  late CameraController _cameraController;


  Future<void> _scanFood() async {
    await ImagePicker.platform.getImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/scan_page_background.png'), fit: BoxFit.cover)),
      child: Column(children: <Widget>[
        FoodScanCameraPreview(),
      ]),
    );
  }
}
