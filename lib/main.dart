import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shortlyst/components/custom_app_bar.dart';
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
  ScrollController scrollController;

  bool _isLoading;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _showBottomSheetCallback = _showBottomSheet;
    ChatList = chats.map((c) {
      return ChatItem(c.text, c.type);
    }).toList();
    scrollController = ScrollController()..addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
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
      body: Stack(
        children: <Widget>[
          Container(
            child: ListView(
              controller: scrollController,
              children: <Widget>[
                Container(width: double.infinity, height: 56.0),
              ]
                ..insertAll(1, ChatList)
                ..insert(ChatList.length + 1, MockLoading())
                ..insert(ChatList.length + 2, Vacancy()),
            ),
          ),
          CustomAppBar(_showBottomSheetCallback),
          FrostedOverlay(_bottomSheetIsOpened, _dismissBottomSheet),
        ],
      ),
    );
  }
}

class MockLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
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
    );
  }
}
