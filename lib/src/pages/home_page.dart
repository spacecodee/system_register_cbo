import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_register_cbo/src/utils/sc_colors.dart';
import 'package:system_register_cbo/src/utils/sc_responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = SCResponsive.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Página de postulantes'),
      ),
      body: Padding(
        padding: EdgeInsets.all(responsive.heightPercentage(1)),
        child: Column(
          children: [
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
    );
  }
}
