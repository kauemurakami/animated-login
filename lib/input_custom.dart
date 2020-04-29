import 'package:flutter/material.dart';

class InputCustom extends StatelessWidget {

  final String hint;
  final bool obscure;
  final Icon icone;

  InputCustom({@required this.hint, this.obscure = false, this.icone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        obscureText: obscure,
        decoration: InputDecoration(
            icon: icone,
            border: InputBorder.none,
            labelText: hint,
            labelStyle: TextStyle(
                fontSize: 18
            )
        ),
      ),
    );
  }
}
