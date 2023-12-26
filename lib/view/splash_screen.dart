// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:movie_app/view/home_screen.dart';
// import 'package:movie_app/widgets/bottom_nav_bar.dart';
// import 'package:movie_app/widgets/contaner.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         title: Text(
//           "           WELCOME \n TO  MOVIEMINGLE",
//           style: GoogleFonts.abrilFatface(
//               fontSize: 30, fontWeight: FontWeight.w800, color: Colors.white),
//         ),
//         centerTitle: true,
//       ),
//       body: Stack(children: [
//         const AllContainer(),
//         Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     height: 300,
//                     width: 300,
                   
//                     decoration: const BoxDecoration(
//                        color: Colors.transparent,
//                       image: DecorationImage(
//                         image: AssetImage(
//                             'asset/MiniTv.png'), // Replace with the path to your image
//                         fit: BoxFit.cover, // Adjust the fit as needed
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               ElevatedButton(onPressed: (){
//                 Navigator.of(context).push(
//                     MaterialPageRoute(builder: (ctx) => const BottomBar()));
//               }, child: Text("Welcome"))
//             ],
//           ),
//         ),
//       ]),
//     );
//   }
// }
