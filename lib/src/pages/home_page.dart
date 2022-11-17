import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_register_cbo/src/utils/sc_responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = SCResponsive.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              //flat button
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).backgroundColor,
                ),
                onPressed: () {
                  context.go('/register-user');
                  /*final documentType = DocumentTypeDto(name: "dni", number: 96541210);

                  final postulante = PostulanteVo(
                    names: "Juan",
                    lastnameFather: "Perez",
                    lastnameMother: "Perez",
                    phoneNumber: "965412145",
                    address: "Av. Los Alamos 123",
                    birthDate: "12/12/1990",
                    disabilityId: "0QU2Jf5T3Uaf885Br0GA",
                    email: "juanperez@gmail.com",
                    genre: "M",
                    maritalStatus: "S",
                    documentTypeId: documentType,
                  );
                  final postulateJob = PostulateJobVo(
                    postulateArea: "5Cwk6BUHbEEHaV7B39Fu",
                    postulateId: postulante,
                    strengthsAbilities: "Excelente",
                  );

                  PostulateJobService.add(postulateJob).then((value) => print("add = $value"));*/
                },
                child: Text('Go to Register User Page'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
