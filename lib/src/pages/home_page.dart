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
        title: Column(
          children: [
            const Text('Página de postulantes'),
            Row(
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
                  child: const Text('Registrar Postulante'),
                ),
                SizedBox(width: responsive.diagonalPercentage(1)),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: ScColors.accent,
                    backgroundColor: Theme.of(context).backgroundColor,
                  ),
                  onPressed: () {
                    context.go('/get-job');
                  },
                  child: const Text('Registrar Postulante en area'),
                ),
              ],
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
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${snapshot.data?[index].postulateId.toString()}'),
                subtitle: Text('${snapshot.data?[index].postulateArea.toString()}'),
              );
            },
          );
        },
      ),
    );
  }
}
