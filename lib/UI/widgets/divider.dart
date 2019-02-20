import 'package:flutter/material.dart';

class divder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 20)),
        Container(
          height: 2,
          width: MediaQuery.of(context).size.width * 0.65,
          color: Color(0xFF707070),
        ),
      ],
    );
  }
}
