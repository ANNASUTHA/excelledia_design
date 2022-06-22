import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String? title;
  final VoidCallback? onPressed;

  const ButtonWidget({Key? key, this.title, required this.onPressed})
      : super(key: key);

  @override
  _PositiveButtonState createState() => _PositiveButtonState();
}

class _PositiveButtonState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:ElevatedButton.styleFrom(
        fixedSize: const Size(280, 45),
        primary: Colors.amberAccent.shade700,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.title ?? '',
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}