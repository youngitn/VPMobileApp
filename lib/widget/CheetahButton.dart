import 'package:flutter/material.dart';

class CheetahButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  CheetahButton({@required this.text, @required this.onPressed});



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(12)),
      child: TextButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }


}
