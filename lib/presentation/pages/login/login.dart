import 'package:flutter/material.dart';
import 'package:travel/core/route/routes.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => GlobalRoute.router.pop(context),
        ),
      ),
      body: Center(
        child: Text('Login'),
      ),
    );
  }
}
