import 'package:flutter/material.dart';
import 'package:system_register_cbo/src/service/disability_service.dart';

class DropDownDisability extends StatefulWidget {
  DropDownDisability({
    Key? key,
  }) : super(key: key);

  @override
  State<DropDownDisability> createState() => _DropDownDisabilityState();
}

class _DropDownDisabilityState extends State<DropDownDisability> {
  var dropdownValue;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: DisabilityService.listDisability,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<DropdownMenuItem<String>> currencyItems = [];
          var length = snapshot.data?.length ?? 0;
          for (int i = 0; i < length; i++) {
            var item = snapshot.data?[i];
            currencyItems.add(
              DropdownMenuItem(
                value: "${item?.id}",
                child: Text('${item?.name}'),
              ),
            );
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton(
                items: currencyItems,
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                value: dropdownValue,
                hint: const Text(
                  "Seleccionar discapacidad",
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
