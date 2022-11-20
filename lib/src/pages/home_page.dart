import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_register_cbo/src/service/postulate_job_service.dart';
import 'package:system_register_cbo/src/utils/sc_colors.dart';
import 'package:system_register_cbo/src/utils/sc_responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = SCResponsive.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: ScColors.accent,
                backgroundColor: Theme.of(context).backgroundColor,
              ),
              onPressed: () {
                context.go('/register-user');
              },
              child: Text(
                'Registrar Postulante',
                style: TextStyle(fontSize: responsive.diagonalPercentage(1.5)),
              ),
            ),
            SizedBox(width: responsive.diagonalPercentage(2)),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: ScColors.accent,
                backgroundColor: Theme.of(context).backgroundColor,
              ),
              onPressed: () {
                context.go('/get-job');
              },
              child: Text(
                'Registrar Postulante en area',
                style: TextStyle(fontSize: responsive.diagonalPercentage(1.5)),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: PostulateJobService.lista(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Padding(
            padding: EdgeInsets.all(responsive.diagonalPercentage(1)),
            child: ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey[300]!,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(
                      responsive.diagonalPercentage(1.5),
                    ),
                    title: Text('Postulante: ${snapshot.data?[index].postulateId.toString()}'),
                    style: ListTileStyle.drawer,
                    subtitle: Text(
                      'Area: ${snapshot.data?[index].postulateArea.toString()}'
                      '\n Habilidades: ${snapshot.data?[index].strengthsAbilities.toString()}',
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
