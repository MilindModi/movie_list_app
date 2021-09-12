import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  String msg;

  ErrorMessage(this.msg);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        this.msg,
        style: TextStyle(
          color: Colors.red,
          fontSize: 15,
        ),
      ),
    );
  }
}
