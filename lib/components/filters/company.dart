import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shortlyst/models/company_model.dart';
import 'package:shortlyst/search_company.dart';
import 'package:shortlyst/components/add_label.dart';
import 'package:shortlyst/components/removable_label.dart';

class Company extends StatefulWidget {
  final List<CompanyModel> _companies;
  final Function(CompanyModel, int) _removeCompany;
  final Function(List<CompanyModel>) _updateSelectedCompanies;
  Company(this._companies, this._removeCompany, this._updateSelectedCompanies);
  @override
  _CompanyState createState() => _CompanyState();
}

class _CompanyState extends State<Company> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Text(
            'Company',
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
        widget._companies.length == 0
            ? AddLabel('Add company filter', () {
                Navigator.of(context).push(CupertinoPageRoute<void>(
                      builder: (BuildContext context) =>
                          SearchCompany(widget._companies, widget._updateSelectedCompanies),
                    ));
              })
            : Column(
                children: <Widget>[
                  SizedBox(
                    height: 40.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget._companies.length + 1),
                      itemBuilder: (BuildContext context, int index) {
                        //return your list
                        if (index == 0) {
                          return Container(width: 20.0);
                        }
                        return RemovableLabel(
                            widget._companies[index - 1], index - 1, widget._removeCompany);
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute<void>(
                            builder: (BuildContext context) =>
                                SearchCompany(widget._companies, widget._updateSelectedCompanies),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            color: Colors.blue,
                          ),
                          Text(
                            'Add company filter',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
        Padding(padding: EdgeInsets.all(10.0)),
      ],
    );
  }
}
