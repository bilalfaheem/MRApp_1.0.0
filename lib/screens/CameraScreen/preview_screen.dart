// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';

// import 'package:flutter_native_image/flutter_native_image.dart';
// import 'package:mrapp/screens/CameraScreen/crop_screen.dart';

// // class PreviewPage extends StatelessWidget {
// //   const PreviewPage({Key? key, required this.picture}) : super(key: key);

// //   final XFile picture;
// //       Future<String> resizePhoto(String filePath) async {
// //       ImageProperties properties = await FlutterNativeImage.getImageProperties(filePath);

// //       int width = properties.width!.toInt() ;
// //       debugPrint("$width\width of picture");
// //        var offset = (properties.height! - (properties.height!*0.3)) / 2;
// //       // var offset = (properties.height - properties.width) / 2;

// //       File croppedFile = await FlutterNativeImage.cropImage(
// //           filePath, 0, offset.round(), width, width);

// //       return croppedFile.path;
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Preview Page')),
// //       body: Center(
// //         child: Column(mainAxisSize: MainAxisSize.min, children: [
// //           Image.file(File(picture.path), fit: BoxFit.cover, width: 250),
// //           const SizedBox(height: 24),
// //           Text(picture.name),
// //           ElevatedButton(
// //             onPressed: (){
// //               resizePhoto(picture.path);
// //               Navigator.push(context, MaterialPageRoute(builder: (context) => CropScreen(picture: picture,)));
// //             }, child: Text("Crop"))

// //         ]),
// //       ),
// //     );
// //   }
// // }

// class PreviewPagee extends StatefulWidget {
//   final String picture;
//    PreviewPagee({required this.picture});

//   @override
//   State<PreviewPagee> createState() => _PreviewPageeState();
// }

// class _PreviewPageeState extends State<PreviewPagee> {
//   //  File cropFile =  picture  ;
// //   Future<String> resizePhoto(String filePath) async {
// //       ImageProperties properties = await FlutterNativeImage.getImageProperties(filePath);

// //       int width = properties.width!.toInt() ;
// //       debugPrint("$width\width of pictureeeeeeeeeeeeeeeeeeeeeeeeeeee");
// //        var offset = (properties.height! - (properties.height!*0.3)) / 2;
// //       // var offset = (properties.height - properties.width) / 2;
// // print("into croppppppppppppppppppppppppppppcrop");
// //       File croppedFile = await FlutterNativeImage.cropImage(
// //           filePath, 0, offset.round(), width, width);
// //           // cropFile = croppedFile;
// //           setState(() {
// //             // _cropped = true;
// //           });

// //       return croppedFile.path;
// //   }

//   // File
//   // @override
//   // void initState() {
//   //   resizePhoto(widget.picture.path.toString());
//   //   super.initState();
//   // }
//   @override
//   Widget build(BuildContext context) {
//       return Scaffold(
//       appBar: AppBar(title: const Text('Preview Page')),
//       body: Center(
//         child: Column(mainAxisSize: MainAxisSize.min, children: [
//           Image.file(File(widget.picture), fit: BoxFit.cover, width: 250),
//           const SizedBox(height: 24),
//           Text(widget.picture),
//           ElevatedButton(
//             onPressed: (){
//               // resizePhoto(widget.picture.path);
//               Navigator.push(context, MaterialPageRoute(builder: (context) => CropScreenn(picture: widget.picture)));
//             }, child: Text("Crop")),

//         ]),
//       ),
//     );
//   }
// }

// class PictureMeter extends StatelessWidget {
//   String picturePath;
//    PictureMeter({required this.picturePath});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Image.file(File(picturePath))
//         ],
//       ),
//     );
//   }
// }
