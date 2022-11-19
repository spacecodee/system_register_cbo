import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_register_cbo/src/components/form_item_design.dart';
import 'package:system_register_cbo/src/model/dto/document_type_dto.dart';
import 'package:system_register_cbo/src/model/vo/postulant_vo.dart';
import 'package:system_register_cbo/src/service/disability_service.dart';
import 'package:system_register_cbo/src/service/postulate_service.dart';
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
  final dniNumber = TextEditingController();
  final name = TextEditingController();
  final lastnameFather = TextEditingController();
  final lastnameMother = TextEditingController();
  final email = TextEditingController();
  final numberPhone = TextEditingController();
  final address = TextEditingController();
  final nacimiento = TextEditingController();

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

  Widget formUI() {
    return Column(
      children: [
        FormItemDesign(
          icon: Icons.person,
          item: identifyDocument(),
        ),
        FormItemDesign(
          icon: Icons.insert_drive_file,
          item: TextFormField(
            controller: dniNumber,
            decoration: const InputDecoration(
              labelText: 'Documento de identidad',
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        FormItemDesign(
          icon: Icons.person,
          item: TextFormField(
            controller: name,
            decoration: const InputDecoration(
              labelText: 'Nombres',
            ),
          ),
        ),
        FormItemDesign(
          icon: Icons.person,
          item: TextFormField(
            controller: lastnameFather,
            decoration: const InputDecoration(
              labelText: 'Apellido Paterno',
            ),
          ),
        ),
        FormItemDesign(
          icon: Icons.person,
          item: TextFormField(
            controller: lastnameMother,
            decoration: const InputDecoration(
              labelText: 'Apellido Materno',
            ),
          ),
        ),
        FormItemDesign(
          icon: Icons.account_circle_sharp,
          item: Column(
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
        FormItemDesign(
          icon: Icons.email,
          item: TextFormField(
            controller: email,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        FormItemDesign(
          icon: Icons.email,
          item: TextFormField(
            controller: numberPhone,
            decoration: const InputDecoration(
              labelText: 'Número de teléfono',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        FormItemDesign(
          icon: Icons.account_circle_outlined,
          item: TextFormField(
            controller: address,
            decoration: const InputDecoration(
              labelText: 'Dirección',
            ),
            keyboardType: TextInputType.text,
          ),
        ),
        FormItemDesign(
          icon: Icons.account_circle_outlined,
          item: TextFormField(
            controller: nacimiento,
            decoration: const InputDecoration(
              labelText: 'Fecha de nacimiento',
            ),
            keyboardType: TextInputType.text,
          ),
        ),
        FormItemDesign(
          icon: Icons.person,
          item: disabilityValueCombo(),
        ),
        FormItemDesign(
          icon: Icons.account_circle_sharp,
          item: Column(
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
    final documentType = DocumentTypeDto(name: identityDocument, number: int.parse(dniNumber.value.text));
    final postulantVo = PostulanteVo(
      documentTypeId: documentType,
      names: name.value.text,
      lastnameFather: lastnameFather.value.text,
      lastnameMother: lastnameMother.value.text,
      phoneNumber: numberPhone.value.text,
      address: address.value.text,
      birthDate: nacimiento.value.text,
      disabilityId: disabilityValue.toString().trim(),
      email: email.value.text,
      genre: gender,
      maritalStatus: maritalStatus,
    );

    PostulateService.add(postulantVo).then((value) {
      if (value.isNotEmpty) {
        clearForm();
        context.go('/get-job');
      }
    });
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

  void clearForm() {
    identityDocument = 'DNI';
    disabilityValue;
    gender = 'hombre';
    'soltero';
    dniNumber.clear();
    name.clear();
    lastnameFather.clear();
    lastnameMother.clear();
    email.clear();
    numberPhone.clear();
    address.clear();
    nacimiento.clear();
  }
}
