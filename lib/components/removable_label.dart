

import 'package:flutter/material.dart';
import 'package:shortlyst/models/company_model.dart';

class RemovableLabel extends StatelessWidget {
  final CompanyModel company;
  final int index;
  final Function remove;

  RemovableLabel(this.company, this.index, this.remove);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () => remove(company, index),
              child: Icon(
                Icons.close,
                size: 18.0,
              ),
            ),
            Text(company.name),
          ],
        ),
      ),
    );
  }
}