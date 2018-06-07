import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shortlyst/components/filters/company.dart';
import 'package:shortlyst/components/filters/company_tier.dart';
import 'package:shortlyst/components/filters/date_posted.dart';
import 'package:shortlyst/components/filters/experience_level.dart';
import 'package:shortlyst/components/filters/industry.dart';
import 'package:shortlyst/components/filters/job_function.dart';
import 'package:shortlyst/components/filters/job_type.dart';
import 'package:shortlyst/components/filters/sort_by.dart';
import 'package:shortlyst/models/company_model.dart';
import 'package:shortlyst/data_dummy.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

// 088965389430

class _FilterState extends State<Filter> {
  int _sortby = 0;
  int _dateposted = 0;
  List<CompanyModel> _companies = [];
  double _experiencelevel = 0.0;
  int _jobtype = 0;
  int _companytier = 0;

  _updateExperienceLevel(double value) {
    setState(() {
      _experiencelevel = value;
    });
  }

  _updateSelectedLabel(int index, String type) {
    setState((){
      if (type == Label.COMPANY_TIER) {
        _companytier = index;
      } else if (type == Label.DATE_POSTED) {
        _dateposted = index;
      } else if (type == Label.JOB_TYPE) {
        _jobtype = index;
      } else {
        _sortby = index;
      }
    });
  }

  _updateSelectedCompanies(companies) {
    setState(() {
      _companies = companies;
    });
  }

  _removeCompany(company, index) {
    setState(() {
      _companies.removeWhere((c) {
        return c.name == company.name;
      });
    });
  }

  resetForm() {
    setState(() {
      _companies.clear();
      _experiencelevel = 0.0;
      _sortby = 0;
      _dateposted = 0;
      _jobtype = 0;
      _companytier = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            onTap: resetForm,
            child: new Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Reset',
                  style: TextStyle(fontSize: 18.0, color: Colors.red.shade500),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          SortBy(_sortby, _updateSelectedLabel),
          DatePosted(_dateposted, _updateSelectedLabel),
          Company(_companies, _removeCompany, _updateSelectedCompanies),
          ExperienceLevel(_experiencelevel, _updateExperienceLevel),
          JobType(_jobtype, _updateSelectedLabel),
          Industry(),
          JobFunction(),
          CompanyTier(_companytier, _updateSelectedLabel),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Column(
              children: <Widget>[
                Text('11 jobs found', style: TextStyle(color: Colors.grey)),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    elevation: 4.0,
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: new Container(
                      width: double.infinity,
                      child: Text(
                        'Apply Filter',
                        textAlign: TextAlign.center,
                      ),
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
