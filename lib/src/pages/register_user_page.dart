import 'package:flutter/material.dart';
import 'package:system_register_cbo/src/service/disability_service.dart';
import 'package:system_register_cbo/src/utils/sc_responsive.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({Key? key}) : super(key: key);

  @override
  RegisterUserPageState createState() => RegisterUserPageState();
}

class RegisterUserPageState extends State<RegisterUserPage> {
  final list = <String>['DNI', 'Pasaporte', 'Carnet de Extranjería'];
  GlobalKey<FormState> keyForm = GlobalKey();
  var identityDocument = 'DNI', disabilityValue;
  late String gender = 'hombre';
  late String maritalStatus = 'soltero';
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final mobileCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final responsive = SCResponsive.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('REGISTRARSE'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(responsive.diagonalPercentage(1.5)),
          child: Form(
            key: keyForm,
            child: formUI(),
          ),
        ),
      ),
    );
  }

  formItemsDesign(icon, item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Card(child: ListTile(leading: Icon(icon), title: item)),
    );
  }

  Widget formUI() {
    return Column(
      children: [
        formItemsDesign(
          Icons.person,
          identifyDocument(),
        ),
        formItemsDesign(
          Icons.phone,
          TextFormField(
            controller: mobileCtrl,
            decoration: const InputDecoration(
              labelText: 'Documento de identidad',
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        formItemsDesign(
          Icons.person,
          TextFormField(
            controller: nameCtrl,
            decoration: const InputDecoration(
              labelText: 'Nombres',
            ),
          ),
        ),
        formItemsDesign(
          Icons.person,
          TextFormField(
            controller: nameCtrl,
            decoration: const InputDecoration(
              labelText: 'Apellido Paterno',
            ),
          ),
        ),
        formItemsDesign(
          Icons.person,
          TextFormField(
            controller: nameCtrl,
            decoration: const InputDecoration(
              labelText: 'Apellido Materno',
            ),
          ),
        ),
        formItemsDesign(
          Icons.account_circle_sharp,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Genero"),
              RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                title: const Text('Hombre'),
                value: 'hombre',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                title: const Text('Mujer'),
                value: 'mujer',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              )
            ],
          ),
        ),
        formItemsDesign(
          Icons.email,
          TextFormField(
            controller: emailCtrl,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        formItemsDesign(
          Icons.email,
          TextFormField(
            controller: emailCtrl,
            decoration: const InputDecoration(
              labelText: 'Número de teléfono',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        formItemsDesign(
          Icons.account_circle_outlined,
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Dirección',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        formItemsDesign(
          Icons.account_circle_outlined,
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Fecha de nacimiento',
            ),
            keyboardType: TextInputType.text,
          ),
        ),
        formItemsDesign(
          Icons.person,
          disabilityValueCombo(),
        ),
        formItemsDesign(
          Icons.account_circle_sharp,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Estado Cívil"),
              RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                title: const Text('Soltero'),
                value: 'soltero',
                groupValue: maritalStatus,
                onChanged: (value) {
                  setState(() {
                    maritalStatus = value.toString();
                  });
                },
              ),
              RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                title: const Text('Casado'),
                value: 'casado',
                groupValue: maritalStatus,
                onChanged: (value) {
                  setState(() {
                    maritalStatus = value.toString();
                  });
                },
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            save();
          },
          child: Container(
            margin: const EdgeInsets.all(30.0),
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF0EDED2),
                  Color(0xFF03A0FE),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: const Text(
              "Guardar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
      ],
    );
  }

  save() {
    print(identityDocument);
  }

  identifyDocument() {
    return DropdownButton<String>(
      value: identityDocument,
      onChanged: (value) {
        setState(() {
          identityDocument = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  disabilityValueCombo() {
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
                    disabilityValue = value!;
                  });
                },
                value: disabilityValue,
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
