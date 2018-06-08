import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shortlyst/components/custom_bottom_sheet.dart';
import 'package:shortlyst/components/frosted_overlay.dart';
import 'package:shortlyst/components/chat_item.dart';
import 'package:shortlyst/components/recommendation/vacancy.dart';
import 'package:shortlyst/models/chat_item_model.dart';

import 'package:shortlyst/data_dummy.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarIconBrightness: Brightness.dark));
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shortlyst',
      home: new Main(),
    );
  }
}

class Main extends StatefulWidget {
  static const String routeName = '/material/persistent-bottom-sheet';

  @override
  _MainState createState() => new _MainState();
}

class _MainState extends State<Main> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Widget> ChatList;
  bool _bottomSheetIsOpened = false;
  final List<ChatItemModel> _chats = chats;
  VoidCallback _showBottomSheetCallback;

  bool _isLoading;

  Duration timeout = const Duration(seconds: 3);
  Duration ms = const Duration(milliseconds: 1);

  startTimeout([int milliseconds]) {
    print('start');
    var duration = milliseconds == null ? timeout : ms * milliseconds;
    return new Timer(duration, handleTimeout);
  }

  void handleTimeout() {
    // callback function
    setState(() {
      print('handled');
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _showBottomSheetCallback = _showBottomSheet;
    ChatList = chats.map((c) {
      return ChatItem(c.text, c.type);
    }).toList();
    startTimeout(1000);
  }

  void _showBottomSheet() {
    setState(() {
      // disable the button
      _bottomSheetIsOpened = !_bottomSheetIsOpened;
      _showBottomSheetCallback = null;
    });
    _scaffoldKey.currentState
        .showBottomSheet<Null>((BuildContext context) {
      return CustomBottomSheet(_dismissBottomSheet);
    })
        .closed
        .whenComplete(() {
      if (mounted) {
        setState(() {
          // re-enable the button
          _bottomSheetIsOpened = !_bottomSheetIsOpened;
          _showBottomSheetCallback = _showBottomSheet;
        });
      }
    });
  }

  void _dismissBottomSheet() {
    _scaffoldKey.currentState
        .showBottomSheet<Null>((BuildContext context) => null)
        .closed
        .whenComplete(() {
      setState(() {
        // re-enable the button
        _showBottomSheetCallback = _showBottomSheet;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          color: Colors.grey.shade50,
          child: Stack(
            children: <Widget>[
          CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
            centerTitle: true,
            pinned: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: Container(
              padding: EdgeInsets.only(left: 10.0, top: 0.0),
              child: new Container(
                child: Icon(Icons.chevron_left, color: Colors.grey),
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
              ),
            ),
            title: Container(
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
            actions: <Widget>[
              GestureDetector(
                onTap: _showBottomSheetCallback,
                child: Container(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(
                    CupertinoIcons.ellipsis,
                    color: Colors.black,
                    size: 30.0,
                  ),
                ),
              )
            ],
            flexibleSpace: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  padding: EdgeInsets.only(top: 8.0),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: new BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(ChatList),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                MockLoading(_isLoading),
              ],
            ),
          ),
          SliverAppBar(
              centerTitle: true,
              pinned: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: Container(),
              flexibleSpace: _isLoading
                  ? Container()
                  : ClipRect(
                child: BackdropFilter(
                  filter:
                  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: new Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: new BoxDecoration(
                        color: Colors.white.withOpacity(0.35),
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'UX Designer',
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(color: Colors.black54),
                          ),
                          Expanded(
                            child: Text(
                              'in Jakarta, Indonesia',
                              style: TextStyle(
                                  color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              bottom: PreferredSize(
              preferredSize: Size.fromHeight(
              48.0),
          child: _isLoading
              ? Container()
              : Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              'Edit',
              style:
              TextStyle(color: CupertinoColors.activeBlue),
            ),
          ),
        )
    ),//                SliverAppBar(
//                  backgroundColor: Colors.red,
//                  elevation: 0.0,
//                  pinned: true,
//                  bottom: PreferredSize(
//                    preferredSize: Size.fromHeight(48.0),
//                    child: _isLoading
//                        ? Container()
//                        : Padding(
//                            padding: EdgeInsets.all(30.0),
//                            child: Text(
//                              'Edit',
//                              style:
//                                  TextStyle(color: CupertinoColors.activeBlue),
//                            ),
//                          ),
//                  ),
//                  flexibleSpace: FlexibleSpaceBar(
//                    title: _isLoading
//                        ? Container()
//                        : ClipRect(
//                          child: BackdropFilter(
//                            filter:
//                                ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
//                            child: new Center(
//                              child: Container(
//                                padding: EdgeInsets.only(top: 20.0),
//                                width: double.infinity,
//                                height: double.infinity,
//                                decoration: new BoxDecoration(
//                                  color: Colors.white.withOpacity(0.35),
//                                ),
//                                child: Column(
//                                  children: <Widget>[
//                                    Text(
//                                      'UX Designer',
//                                      textAlign: TextAlign.center,
//                                      style:
//                                          TextStyle(color: Colors.black54),
//                                    ),
//                                    Expanded(
//                                      child: Text(
//                                        'in Jakarta, Indonesia',
//                                        style: TextStyle(
//                                            color: Colors.black54),
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                  ),
//                ),
    SliverList
    (
    delegate
        :
    SliverChildListDelegate
    (
    _isLoading
    ?
    [
    ]
        :
    [
    Vacancy
    (
    0
    )
    ,
    Vacancy
    (
    1
    )
    ,
    Vacancy
    (
    2
    )
    ,
    ]
    ,
    )
    ,
    )
    ,
    ]
    ,
    )
    ,
//            CustomAppBar(_showBottomSheetCallback),
    FrostedOverlay
    (
    _bottomSheetIsOpened
    ,
    _dismissBottomSheet
    )
    ,
    ]
    ,
    )
    ,
    )
    ,
    );
  }
}

class MockLoading extends StatelessWidget {
  final bool _isLoading;

  MockLoading(this._isLoading);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _isLoading
        ? Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 20.0,
        ),
        child: Column(
          children: <Widget>[
            Text(
              'Searching for UX Designer position near Jakarta, Indonesia',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 40.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.grey,
            ),
          ],
        ),
      ),
    )
        : Container();
  }
}
