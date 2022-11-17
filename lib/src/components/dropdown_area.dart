import 'package:flutter/material.dart';

class DropDownArea extends StatelessWidget {
  final void Function(String?)? onChanged;

  DropDownArea({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = <String>[
      'DISCAPACIDAD MOTRIZ',
      'DISCAPACIDAD VISUAL',
      'VISUAL Y ESQUEMA CORPORAL',
      'DIMINUIDOS VISUALES',
      'DISCAPACIDAD AUDITIVA',
      'AUTISMO',
      'DISCAPACIDAD MENTAL',
      'PARÁLISIS CEREBRAL',
      'DISCAPACIDAD INTELECTUAL',
      'NO TENGO DISCAPACIDAD'
    ];
    String dropdownValue = 'NO TENGO DISCAPACIDAD';

    return DropdownButton<String>(
      onChanged: onChanged,
      value: dropdownValue,
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
