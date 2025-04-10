import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final Widget widget;
  void Function() ontap;
  final Color? colorButton;
  Mybutton({
    super.key,
    required this.ontap,
    required this.widget,
    this.colorButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: colorButton ?? Colors.grey.shade800,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: ontap,
          splashColor: Colors.white,
          child: Padding(padding: const EdgeInsets.all(25), child: widget),
        ),
      ),
    );
  }
}
