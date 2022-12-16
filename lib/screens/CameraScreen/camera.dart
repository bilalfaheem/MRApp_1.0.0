import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  @override
  void initState() {
    startCamera();
    super.initState();
  }

void startCamera()async{
  cameras = await availableCameras();

  cameraController = CameraController(cameras[0], ResolutionPreset.high,enableAudio:false,imageFormatGroup: ImageFormatGroup.jpeg);

  await cameraController.initialize().then((value) {
    if(!mounted){
      return;
    }
    setState(() {}); // to refresh widget
  }).catchError((e){
    print(e);
  });
}

@override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    if(cameraController.value.isInitialized){
      return Scaffold(
        body: Stack(
          children: [
            CameraPreview(cameraController,),
            Positioned(
              left: 100,
              right: 100,
              child: Container(
                color: Color.fromARGB(93, 255, 193, 7),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.black,
                      height: 100,
                      width: 100,
                    )
                  ],
                ),
              ),),
            )        
          ],
        ),
      );
    }
    else{
      return  
      Scaffold(
        body: SizedBox(),
      );
      
    }
    
  }
}