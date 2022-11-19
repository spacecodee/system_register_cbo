import 'package:flutter/material.dart';

class FormItemDesign extends StatelessWidget {
  final IconData icon;
  final Widget item;

  const FormItemDesign({
    Key? key,
    required this.icon,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Card(child: ListTile(leading: Icon(icon), title: item)),
    );
  }
}
