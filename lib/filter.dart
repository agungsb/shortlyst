import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shortlyst/components/filters/company_tier.dart';
import 'package:shortlyst/components/filters/date_posted.dart';
import 'package:shortlyst/components/filters/job_type.dart';
import 'package:shortlyst/components/filters/sort_by.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarIconBrightness: Brightness.light));
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          iconSize: 30.0,
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text(
          'Filter',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          GestureDetector(
            child: new Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Reset',
                  style: TextStyle(fontSize: 18.0, color: Colors.grey.shade500),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          SortBy(),
          DatePosted(),
          JobType(),
          CompanyTier(),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Column(
              children: <Widget>[
                Text('11 jobs found', style: TextStyle(color: Colors.grey)),
                new Container(
                  padding: EdgeInsets.all(20.0),
                  child: RaisedButton(
                    onPressed: () {},
                    elevation: 4.0,
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: new Container(
                      width: double.infinity,
                      child: Text('Apply Filter', textAlign: TextAlign.center,),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
