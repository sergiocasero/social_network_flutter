import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  const AuthButton(
      {Key key,
      this.title,
      this.onTap,
      this.backgroundColor,
      this.borderColor,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        width: double.infinity,
        child: RaisedButton(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: TextStyle(color: textColor),
            ),
          ),
          onPressed: () => onTap(),
          color: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: borderColor)),
        ),
      ),
    );
  }
}
