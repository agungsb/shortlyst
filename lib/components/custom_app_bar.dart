import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';

class CustomAppBar extends StatelessWidget {
  final VoidCallback _showBottomSheetCallback;

  CustomAppBar(this._showBottomSheetCallback);

  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: CupertinoNavigationBar(
        border: Border(bottom: BorderSide.none),
        leading: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 0.3,
              ),
            ],
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.chevron_left, color: Colors.grey),
        ),
        middle: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: RichText(
            text: TextSpan(
              text: 'Sandra ',
              style: TextStyle(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: ' from Shortlyst',
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
        trailing: GestureDetector(
          onTap: _showBottomSheetCallback,
          child: Icon(
            CupertinoIcons.ellipsis,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
