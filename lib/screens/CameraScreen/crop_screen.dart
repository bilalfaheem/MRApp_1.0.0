// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'dart:io';

// import 'package:flutter_native_image/flutter_native_image.dart';
// import 'package:mrapp/screens/CameraScreen/preview_screen.dart';

// // class CropScreen extends StatelessWidget {
// //    final XFile picture;
// //   const CropScreen({Key? key, required this.picture}) : super(key: key);

//   //     Future<String> resizePhoto(String filePath) async {
//   //     ImageProperties properties = await FlutterNativeImage.getImageProperties(filePath);

//   //     int width = properties.width!.toInt() ;
//   //     debugPrint("$width\width of picture");
//   //      var offset = (properties.height! - (properties.height!*0.3)) / 2;
//   //     // var offset = (properties.height - properties.width) / 2;

//   //     File croppedFile = await FlutterNativeImage.cropImage(
// //   //         filePath, 0, offset.round(), width, width);

// //   //     return croppedFile.path;
// //   // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Crop Page')),
// //       body: Center(
// //         child: Column(mainAxisSize: MainAxisSize.min, children: [
// //           Image.file(File(picture.path), fit: BoxFit.cover, width: 250),
// //           const SizedBox(height: 24),
// //           // Text(picture.name),
// //           // ElevatedButton(
// //           //   onPressed: (){
// //           //     resizePhoto(picture.path);
// //           //   }, child: Text("Crop"))

// //         ]),
// //       ),
// //     );
// //   }
// // }

// class CropScreenn extends StatefulWidget {
//   final String picture;
//   const CropScreenn({Key? key, required this.picture}) : super(key: key);
//   // const CropScreenn({super.key});

//   @override
//   State<CropScreenn> createState() => _CropScreennState();
// }

// class _CropScreennState extends State<CropScreenn> {
// var imageFile;
// bool _cropped = false;
//     Future<String> resizePhoto(String filePath) async {
//       ImageProperties properties = await FlutterNativeImage.getImageProperties(filePath);
//     print('$filePath file path');
//       int width = properties.width!.toInt() ;
//       // debugPrint("$width width of pictureeeeeeeeeeeeeeeeeeeeeeeeeeee");
//        var offset = (properties.height! - (properties.height!*0.3)) / 2;
//       // var offset = (properties.height - properties.width) / 2;
//       int cropHeight = properties.height!.toInt();
//       int cropWidth = properties.width!.toInt();
//       print("$cropHeight height");
//       print("$cropWidth width");
//       print((cropHeight*0.5).toString());
//       int imageHeight =int.parse((cropHeight*0.25).toString().split(".")[0]);
//       int originY =int.parse((cropHeight*0.38).toString().split(".")[0]);
//       print(imageHeight);

//       print(originY);
//       // print("${properties.width} width");
//       print("into croppppppppppppppppppppppppppppcrop");
//       File cropImageFile = await FlutterNativeImage.cropImage(filePath,
//       // properties.width!*0.1.toInt(),
//       // properties.height!*0.3.toInt(),
//       0, // distance from top
//       originY, // yaxis,
//       cropWidth,//height 720
//       imageHeight//width 1280
//        );
//       imageFile = cropImageFile;
//       // File croppedFile = await FlutterNativeImage.cropImage(
//       //     filePath, 0, offset.round(), width, width);

//           // print("$croppedFile+ddd");
//           setState(() {
//             _cropped = true;
//           });

//       return cropImageFile.path;
//   }

//   // @override
//   // void initState() {
//   // resizePhoto(widget.picture.path);
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title:  Text('$_cropped Page')),
//       body: Center(
//         child: Column(mainAxisSize: MainAxisSize.min,
//         children: [
//             ElevatedButton(
//             onPressed: (){
//               resizePhoto(widget.picture);

//             }, child: Text("Crop")),
//           _cropped?
//           Image.file(File(imageFile.path), fit: BoxFit.cover, width: 250):
//           CircularProgressIndicator(),
//           const SizedBox(height: 24),
//           // Text(picture.name),
//           // ElevatedButton(
//           //   onPressed: (){
//           //     resizePhoto(picture.path);
//           //   }, child: Text("Crop"))

//         ]),
//       ),
//     );
//   }
// }
