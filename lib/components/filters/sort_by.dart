import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shortlyst/components/selectable_row.dart';

class SortBy extends StatelessWidget {
  final int _selectedIndex;
  final Function(int, String) _updateSelectedLabel;

  SortBy(this._selectedIndex, this._updateSelectedLabel);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Sort by',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          SelectableRow('Highest Match Percentage', 0, _selectedIndex == 0,
              _updateSelectedLabel),
          SelectableRow(
              'Most recent', 1, _selectedIndex == 1, _updateSelectedLabel),
        ],
      ),
    );
  }
}
