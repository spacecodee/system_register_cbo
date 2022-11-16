import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:system_register_cbo/src/routes/routes.gr.dart';
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
                  context.router.push(const RegisterUserRoute());
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
