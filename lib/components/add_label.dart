import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AddLabel extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  AddLabel(this.text, this.onTap);

  @override
  _AddLabelState createState() => _AddLabelState();
}

class _AddLabelState extends State<AddLabel>
    with TickerProviderStateMixin {
  AnimationController _itemController;
  Animation<double> _itemAnimation;

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
        } else if(status == AnimationStatus.dismissed) {
          widget.onTap();
        }
      });
    _itemAnimation = Tween(begin: 1.0, end: 0.9).animate(CurvedAnimation(
      parent: _itemController,
      curve: Interval(0.0, 1.0, curve: Curves.easeIn),
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _itemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 80.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                _itemController.forward();
              },
              child: ScaleTransition(
                scale: _itemAnimation,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Text(
                    '+ ' + widget.text,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14.0, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
