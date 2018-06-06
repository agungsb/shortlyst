import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SelectableLabel extends StatefulWidget {
  final String text;

  SelectableLabel(this.text);

  @override
  _SelectableLabelState createState() => _SelectableLabelState();
}

class _SelectableLabelState extends State<SelectableLabel>
    with TickerProviderStateMixin {
  AnimationController _itemController;
  AnimationController _borderController;
  AnimationController _iconController;
  Animation<double> _itemAnimation;
  Animation<Color> _borderAnimation;
  Animation<double> _iconAnimation;

  bool checked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _itemController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _itemController.reverse();
            }
          });
    _borderController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100))
          ..addListener(() {
            setState(() {});
          });
    _iconController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100))
          ..addListener(() {
            setState(() {});
          });
    _itemAnimation = Tween(begin: 1.0, end: 0.9).animate(CurvedAnimation(
      parent: _itemController,
      curve: Interval(0.0, 1.0, curve: Curves.easeIn),
    ));
    _borderAnimation =
        ColorTween(begin: Colors.grey, end: CupertinoColors.activeBlue)
            .animate(CurvedAnimation(
      parent: _borderController,
      curve: Interval(0.0, 1.0, curve: Curves.easeIn),
    ));
    _iconAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _iconController,
      curve: Interval(0.0, 1.0, curve: Curves.bounceOut),
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _itemController.dispose();
    _iconController.dispose();
    _borderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 80.0,
      child: Center(
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                _itemController.forward();
                if (!checked) {
                  _borderController.forward();
                  _iconController.forward();
                } else {
                  _borderController.reverse();
                  _iconController.reverse();
                }
                checked = !checked;
              },
              child: ScaleTransition(
                scale: _itemAnimation,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: _borderAnimation.value),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Text(
                    widget.text,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14.0, color: _borderAnimation.value),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -15.0,
              right: 0.0,
              child: FadeTransition(
                opacity: _iconAnimation,
                child:
                    Icon(Icons.check_circle, color: CupertinoColors.activeBlue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
