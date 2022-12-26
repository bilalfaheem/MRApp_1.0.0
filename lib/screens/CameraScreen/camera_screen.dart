
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:mrapp/screens/CameraScreen/preview_screen.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key, required this.cameras}) : super(key: key);

  final List<CameraDescription>? cameras;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _cameraController;
  bool _isRearCameraSelected = true;

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras![0]);
  }

  Future takePicture() async {
    debugPrint("Taking Picture");
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
       await _cameraController.setFlashMode(FlashMode.off);
       await _cameraController.setFocusMode(FocusMode.auto);
       await _cameraController.setExposureMode(ExposureMode.auto);
      //  await _cameraController.set
      XFile picture = await _cameraController.takePicture();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => 
              PreviewPagee(picture: picture)
              // PreviewPage(
              //       picture: picture,
              //     )
                  ));
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  //   Future takePictureSave() async {
  //   debugPrint("Taking Picture");
  //   if (!_cameraController.value.isInitialized) {
  //     return null;
  //   }
  //   if (_cameraController.value.isTakingPicture) {
  //     return null;
  //   }
  //   try {
  //      await _cameraController.setFlashMode(FlashMode.off);
  //      await _cameraController.setFocusMode(FocusMode.auto);
  //      await _cameraController.setExposureMode(ExposureMode.auto);
  //     //  await _cameraController.set
  //     XFile picture = await _cameraController.takePicture();
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => PreviewPage(
  //                   picture: picture,
  //                 )));
  //   } on CameraException catch (e) {
  //     debugPrint('Error occured while taking picture: $e');
  //     return null;
  //   }
  // }

  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController =  CameraController(cameraDescription, ResolutionPreset.high,enableAudio: false);
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }
    Future<String> resizePhoto(String filePath) async {
      ImageProperties properties = await FlutterNativeImage.getImageProperties(filePath);

      int width = properties.width!.toInt() ;
      debugPrint("$width\width of picture");
       var offset = (properties.height! - (properties.height!*0.3)) / 2;
      // var offset = (properties.height - properties.width) / 2;

      File croppedFile = await FlutterNativeImage.cropImage(
          filePath, 0, offset.round(), width, width);

      return croppedFile.path;
  }
  //   Future<String> resizePhotoDirect(String filePath) async {
  //     ImageProperties properties = await FlutterNativeImage.getImageProperties(filePath);

  //     int? width = properties.width;
  //     var offset = (properties.height - properties.width) / 2;

  //     File croppedFile = await FlutterNativeImage.cropImage(
  //         filePath, 0, offset.round(), width, width);

  //     return croppedFile.path;
  // }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        (_cameraController.value.isInitialized)
            ? CameraPreview(_cameraController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    color: Color.fromARGB(169, 0, 0, 0),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     Expanded(
                  child: Container(
                    height: 120,
                    // width: 60,
                    color: Color.fromARGB(169, 0, 0, 0),
                  ),
                ),
                    Container(
                      height: 120,
                      width: size.width*0.85,
                      color: Colors.transparent,
                    ),
                     Expanded(
                       child: Container(
                        height: 120,
                        //  width: 60,
                         color: Color.fromARGB(169, 0, 0, 0),
                       ),
                     ),
                  ],
                ),
                  Expanded(
                    child: Container(
                    color: Color.fromARGB(169, 0, 0, 0),
                                  ),
                  ),
              ],
            ),)
            : Container(
                color: Colors.black,
                child: const Center(child: CircularProgressIndicator(color: Colors.white,))),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.20,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  color: Colors.black),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(
                    child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 30,
                  icon: Icon(
                      _isRearCameraSelected
                          ? CupertinoIcons.switch_camera
                          : CupertinoIcons.switch_camera_solid,
                      color: Colors.white),
                  onPressed: () {
                    // setState(
                    //     () => 
                        _isRearCameraSelected = !_isRearCameraSelected;
                        // );
                    initCamera(widget.cameras![_isRearCameraSelected ? 0 : 1]);
                  },
                )),
                Expanded(
                    child: IconButton(
                  onPressed: takePicture,
                  iconSize: 60,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.circle, color: Colors.white),
                )),
                const Spacer(),
              ]),
            )),
      ]),
    ));
  }
}