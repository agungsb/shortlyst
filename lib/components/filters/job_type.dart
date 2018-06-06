import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shortlyst/components/selectable_label.dart';

class JobType extends StatelessWidget {
  final _labels = [
    '',
    'Full-time',
    'Part-time',
    'Internship',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                'Job Type',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 80.0,
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
