import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function(String) onSaved;
  final Function(String) validator;
  final bool isPassword;

  const AuthTextFormField(
      {Key key, this.label, this.onSaved, this.validator, this.icon, this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        icon: Icon(icon),
      ),
      obscureText: isPassword,
      validator: validator,
      onSaved: (value) => onSaved(value),
    );
  }
}
