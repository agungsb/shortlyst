import 'package:flutter/material.dart';

class ExperienceLevel extends StatefulWidget {
  @override
  _ExperienceLevelState createState() => _ExperienceLevelState();
}

class _ExperienceLevelState extends State<ExperienceLevel> {
  double _discreteValue = 1.0;
  List<String> _labels = ['Any', 'Entry Level', 'Beginner Level', 'Mid Level', 'Senior Level'];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Experience Level (${_labels[_discreteValue.toInt()]})",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          Slider(
            value: _discreteValue,
            min: 0.0,
            max: 4.0,
            divisions: 4,
            label: '${_labels[_discreteValue.toInt()]}',
            onChanged: (double value) {
              setState(() {
                _discreteValue = value;
              });
            },
          )
        ],
      ),
    );
  }
}