import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sarah/widgets/foodScan/image_capture_buttons.dart';

class FoodScanCameraPreview extends StatefulWidget {
  const FoodScanCameraPreview({super.key});

  @override
  State<FoodScanCameraPreview> createState() => _FoodScanCameraPreviewState();
}

class _FoodScanCameraPreviewState extends State<FoodScanCameraPreview> {
  late List<CameraDescription> _cameras;
  late CameraController _cameraController;

  @override
  void initState() {
    _openCamera();
    // TODO: implement initState
    super.initState();
  }

  void _openCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.high,
        enableAudio: false);
    await _cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {
      });
    }).catchError((exception) {
      print(exception);
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController.value.isInitialized) {
      return Container(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 0.65,
              child: CameraPreview(_cameraController),
            ),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/6, right: MediaQuery.of(context).size.width/4),
              child: ImageCaptureButtons(cameraController: _cameraController,)
            )
          ],
        ),
      );
    } else
      return const CircularProgressIndicator();
  }
}
