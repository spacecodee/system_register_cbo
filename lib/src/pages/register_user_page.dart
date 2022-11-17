import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterUserPage extends StatelessWidget {
  const RegisterUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register User Page'),
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
                  context.go('/');
                },
                child: Text('Go to Home Page'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
