import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedOverlay extends StatelessWidget {
  final bool show;
  final VoidCallback onTap;
  FrostedOverlay(this.show, this.onTap);
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRect(
        child: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          child: new Container(
            width: show ? double.infinity : 0.0,
            height: show ? double.infinity : 0.0,
            decoration: new BoxDecoration(
                color: Colors.grey.shade200.withOpacity(0.5)
            ),
//          child: new Center(
//            child: new Text(
//                'Frosted',
//                style: Theme
//                    .of(context)
//                    .textTheme
//                    .display3
//            ),
//          ),
          ),
        ),
      ),
    );
  }
}