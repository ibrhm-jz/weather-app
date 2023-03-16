// import 'package:flutter/material.dart';

// class Weather extends StatefulWidget {
//   const Weather({super.key});

//   @override
//   WeatherState createState() => WeatherState();
// }

// class WeatherState extends State<Weather> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Container(
//           decoration: const BoxDecoration(
//             gradient: RadialGradient(
//               colors: <Color>[
//                 Color(0xFFb2b4c1),
//                 Color(0xFF2d2e4d),
//               ],
//             ),
//           ),
//           child: Container(
//             margin: const EdgeInsets.all(20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const Text(
//                   'Clouds',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                   ),
//                 ),
//                 const Text(
//                   'broken clouds',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 12,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: const [
//                     Text(
//                       'Humidity\n60%',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Text(
//                       'Pressure\n1016',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                       ),
//                       textAlign: TextAlign.center,
//                     )
//                   ],
//                 ),
//                 Expanded(child: Container()),
//                 const Center(
//                   child: Text(
//                     'Moscuw,Russia',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//                 Center(
//                   child: Image.asset(
//                     'assets/04.png',
//                     width: 250,
//                   ),
//                 ),
//                 Expanded(child: Container()),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     Text(
//                       '39°',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w100,
//                         fontSize: 100,
//                         fontFamily: 'Adam',
//                       ),
//                     ),
//                     Text(
//                       'Temp max\n60%',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Text(
//                       'Tem min\n1016',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(width: 10),
//                     Text(
//                       'Speed\n2.24',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                       ),
//                       textAlign: TextAlign.center,
//                     )
//                   ],
//                 ),
//                 const Text(
//                   'Feel Likes',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 12,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// //                     fontSize: 12,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 40),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
