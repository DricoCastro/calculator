import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const colorDark = Color.fromRGBO(82, 82, 82, 1);
  static const colorDefault = Color.fromRGBO(112, 112, 112, 1);
  static const colorOperation = Color.fromRGBO(60, 170, 155, 1);

  final String text;
  final bool big;
  final Color color;
  final void Function(String) cb;

  const Button({
    Key? key,
    required this.text,
    this.big = false,
    this.color = colorDefault,
    required this.cb,
  }) : super(key: key);

  const Button.big({
    Key? key,
    required this.text,
    this.big = true,
    this.color = colorDefault,
    required this.cb,
  }) : super(key: key);

  const Button.operation({
    Key? key,
    required this.text,
    this.big = false,
    this.color = colorOperation,
    required this.cb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          )),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w300,
          ),
        ),
        onPressed: () => cb(text),
      ),
    );
  }
}
