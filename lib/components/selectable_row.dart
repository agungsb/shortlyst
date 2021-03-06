import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SelectableRow extends StatefulWidget {
  final String _text;
  final int _index;
  final bool _checked;
  final Function(int, String) _updateSelectedLabel;

  SelectableRow(this._text, this._index, this._checked, this._updateSelectedLabel);

  @override
  _SelectableRowState createState() => _SelectableRowState();
}

class _SelectableRowState extends State<SelectableRow> with TickerProviderStateMixin {
  AnimationController _itemController;
  AnimationController _iconController;
  Animation<double> _itemAnimation;
  Animation<double> _iconAnimation;

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
    _iconController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 100))
      ..addListener(() {
        setState(() {});
      });
    _itemAnimation = Tween(begin: 1.0, end: 0.9).animate(CurvedAnimation(
      parent: _itemController,
      curve: Interval(0.0, 1.0, curve: Curves.easeIn),
    ));
    _iconAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _iconController,
      curve: Interval(0.0, 1.0, curve: Curves.bounceOut),
    ));
    if (widget._checked) {
      _iconController.forward();
      _itemController.forward();
    }
  }

  @override
  void didUpdateWidget(SelectableRow oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (!widget._checked) {
      _iconController.reverse();
    } else {
      _iconController.forward();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _iconController.dispose();
    _itemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        _itemController.forward();
        if (widget._checked) {
          _iconController.reverse();
        } else {
          _iconController.forward();
        }
        widget._updateSelectedLabel(widget._index, 'sortby');
      },
      child: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            new Flexible(
              flex: 1,
              child: new ScaleTransition(
                scale: _itemAnimation,
                child: Text(
                  widget._text,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
            ),
            FadeTransition(
              opacity: _iconAnimation,
              child: Container(
                margin: EdgeInsets.only(left: 4.0),
                child: Icon(
                  Icons.check,
                  size: 20.0,
                  color: CupertinoColors.activeGreen,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}