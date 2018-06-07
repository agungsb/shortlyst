import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shortlyst/data_dummy.dart';
import 'package:shortlyst/components/removable_label.dart';
import 'package:shortlyst/models/company_model.dart';

class SearchCompany extends StatefulWidget {
  final Function _updateSelectedCompanies;
  final List<CompanyModel> _selectedCompanies;
  SearchCompany(this._selectedCompanies, this._updateSelectedCompanies);
  @override
  _SearchCompanyState createState() => _SearchCompanyState();
}

class _SearchCompanyState extends State<SearchCompany> {
  List<CompanyModel> _companies = Companies().getAll;

  List<CompanyModel> _selectedCompanies;

  TextEditingController _searchController;

  _resetKeyword() {
    setState(() {
      _searchController.text = '';
    });
  }

  _resetCompanies() {
    _companies.clear();
    if (_selectedCompanies.length > 0) {
      List<CompanyModel> _temp = Companies().getAll;
      for(int i = 0; i < _selectedCompanies.length; i++) {
        CompanyModel company = _selectedCompanies[i];
        print('company: ' + company.name);
        _temp.removeWhere((t) {
          return t.name == company.name;
        });
      }
      _companies = _temp;
    } else {
      _companies = Companies().getAll;
    }
  }

  _addCompany(CompanyModel company, int index) {
    setState(() {
      _companies.removeWhere((CompanyModel c) {
        return c.name.toLowerCase() == company.name.toLowerCase();
      });
      _selectedCompanies.add(company);
//      _resetCompanies();
    });
  }

  _removeCompany(CompanyModel company, int index) {
    setState(() {
      _companies.add(company);
      _companies.sort(([a, b]) {
        return a.name.compareTo(b.name);
      });
      _selectedCompanies.removeAt(index);
//      _resetCompanies();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedCompanies = widget._selectedCompanies;
    _resetCompanies();
    _searchController = TextEditingController(text: '')
      ..addListener(() {
        setState(() {
          if (_searchController.text != '') {
            _companies.removeWhere((CompanyModel company) {
              bool res = company.name
                      .toLowerCase()
                      .indexOf(_searchController.text.toLowerCase()) <
                  0;
              return res;
            });
          } else {
            _resetCompanies();
          }
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarIconBrightness: Brightness.light));
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: Theme.of(context).iconTheme,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            color: CupertinoColors.lightBackgroundGray,
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
              ),
              Flexible(
                flex: 1,
                child: Theme(
                  data: ThemeData(primaryColor: Color(0xffe3a5e93)),
                  child: TextField(
//                    onSubmitted: _submitSearch,
                    controller: _searchController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search company',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    obscureText: false,
                  ),
                ),
              ),
              _searchController.text != '' ?
              GestureDetector(
                onTap: _resetKeyword,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RotationTransition(
                    turns: new AlwaysStoppedAnimation(45 / 360),
                    child: Icon(
                      Icons.add_circle,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ) : Text(''),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _selectedCompanies.length > 0
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'You can add more than one company',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Container(),
          _selectedCompanies.length > 0
              ? SizedBox(
                  height: 40.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (_selectedCompanies.length + 1),
                    itemBuilder: (BuildContext context, int index) {
                      //return your list
                      if (index == 0) {
                        return Container(width: 20.0);
                      }
                      return RemovableLabel(_selectedCompanies[index - 1], index - 1,
                          _removeCompany);
                    },
                  ))
              : Container(),
          Padding(
            padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            child: Text(
              'Suggestion',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: _companies.length > 0 ? ListView.builder(
              itemCount: _companies.length,
              itemBuilder: (BuildContext context, int index) {
                return _Item(_companies[index], _addCompany, index);
              },
            ) : Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                'No Result',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final CompanyModel company;
  final Function add;
  final int index;

  _Item(this.company, this.add, this.index);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.only(right: 15.0),
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
              Text(company.name, style: TextStyle(fontSize: 18.0)),
            ],
          ),
          GestureDetector(
              onTap: () => add(company, index),
              child: Icon(Icons.add, size: 30.0, color: Colors.grey.shade400)),
        ],
      ),
    );
  }
}
