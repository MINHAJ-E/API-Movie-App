
import 'dart:ui';

import 'package:flutter/material.dart';

class AllContainer extends StatelessWidget {
  const AllContainer({
    super.key, 
    // this.height, this.width,
  });
// final height;
// final width;
  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
          Color(0xff1f005c),
              Color(0xff5b0060),
              // Color(0xff870160),
              Colors.black
              // Color(0xffac255e),
              // Color(0xffca485c),
              // Color(0xffe16b5c),
              // Color(0xfff39060),
              // Color(0xffffb56b),
              ],
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
            child: Container(
              decoration: const BoxDecoration(color: Colors.transparent),
            ),
          ),
          
        );
  }
}