import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_register_cbo/src/components/form_item_design.dart';
import 'package:system_register_cbo/src/model/vo/postulate_job_vo.dart';
import 'package:system_register_cbo/src/service/postulate_area_service.dart';
import 'package:system_register_cbo/src/service/postulate_job_service.dart';
import 'package:system_register_cbo/src/service/postulate_service.dart';
import 'package:system_register_cbo/src/utils/sc_responsive.dart';

class GetJobPage extends StatefulWidget {
  const GetJobPage({Key? key}) : super(key: key);

  @override
  State<GetJobPage> createState() => _GetJobPageState();
}

class _GetJobPageState extends State<GetJobPage> {
  var peopleValue, postulateAreaValue;
  final strengthsAbilities = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final responsive = SCResponsive.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecciona el area a postular'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(responsive.diagonalPercentage(1.5)),
          child: Form(
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
          item: peopleCombo(),
        ),
        FormItemDesign(
          icon: Icons.person,
          item: areaCombo(),
        ),
        FormItemDesign(
          icon: Icons.insert_drive_file,
          item: TextFormField(
            controller: strengthsAbilities,
            decoration: const InputDecoration(
              labelText: 'Fortalezas y Habilidades',
            ),
            keyboardType: TextInputType.text,
            maxLength: 100,
            maxLines: 4,
            minLines: 1,
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

  peopleCombo() {
    return StreamBuilder(
      stream: PostulateService.listPostulante,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<DropdownMenuItem<String>> currencyItems = [];
          var length = snapshot.data?.length ?? 0;
          for (int i = 0; i < length; i++) {
            var item = snapshot.data?[i];
            currencyItems.add(
              DropdownMenuItem(
                value: "${item?.id}",
                child: Text('${item?.names},Teléfono:  ${item?.phoneNumber}'),
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
                    peopleValue = value!;
                  });
                },
                value: peopleValue,
                hint: const Text(
                  "Seleccionar persona",
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

  areaCombo() {
    return StreamBuilder(
      stream: PostulateAreaService.listAreas,
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
                    postulateAreaValue = value!;
                  });
                },
                value: postulateAreaValue,
                hint: const Text(
                  "Seleccionar Area a postular",
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

  void save() {
    final postulateJob = PostulateJobVo(
      postulateId: peopleValue.toString().trim(),
      postulateArea: postulateAreaValue.toString().trim(),
      strengthsAbilities: strengthsAbilities.value.text.trim(),
    );
    PostulateJobService.add(postulateJob).then((value) {
      if (value) {
        strengthsAbilities.clear();
        context.go('/');
      }
    });
  }
}
