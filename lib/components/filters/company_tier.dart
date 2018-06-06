import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shortlyst/components/selectable_label.dart';

class CompanyTier extends StatelessWidget {
  final _labels = [
    '',
    '1st tier',
    '2nd tier',
    '3rd tier',
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                'Company Tier',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 85.0,
              child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _labels.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Container(width: 20.0);
                  }
                  return SelectableLabel(_labels[index]);
                },
              ),
            ),
          ],
        ));
  }
}