import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shortlyst/filter.dart';

const HEIGHT = 70.0;

class CustomBottomSheet extends StatelessWidget {
  final VoidCallback _dismissBottomSheet;

  CustomBottomSheet(this._dismissBottomSheet);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: HEIGHT * 4,
      child: Column(
        children: <Widget>[
          BottomSheetMenu(
            Row(
              children: const <Widget>[
                const Text(
                  'X',
                  style: const TextStyle(
                    fontSize: 24.0,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            _dismissBottomSheet,
          ),
          BottomSheetMenu(
            Row(
              children: const <Widget>[
                const Text(
                  'Filter',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                )
              ],
            ),
            () {
              Navigator.of(context).push(new CupertinoPageRoute<void>(
                builder: (BuildContext context) => Filter(),
              ));
              _dismissBottomSheet();
            },
          ),
          BottomSheetMenu(
            Row(
              children: const <Widget>[
                const Text(
                  'History',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                )
              ],
            ),
            () {},
          ),
          BottomSheetMenu(
            Row(
              children: const <Widget>[
                const Text(
                  'My Profile',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                )
              ],
            ),
            () {},
          ),
        ],
      ),
    );
  }
}

class BottomSheetMenu extends StatelessWidget {
  final Widget _child;
  final VoidCallback _onTap;

  BottomSheetMenu(this._child, this._onTap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: _onTap,
      child: new Container(
        decoration: const BoxDecoration(
          color: CupertinoColors.white,
          border: const Border(
//            top: const BorderSide(color: const Color(0xFFBCBBC1), width: 0.0),
            bottom:
                const BorderSide(color: const Color(0xFFBCBBC1), width: 0.0),
          ),
        ),
        height: HEIGHT,
        child: new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: new SafeArea(
            top: false,
            bottom: false,
            child: _child,
          ),
        ),
      ),
    );
  }
}
