import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riverpod_flutter/home/home_controller.dart';
import 'package:riverpod_flutter/home/home_screen.dart';
import 'package:riverpod_flutter/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ChangeNotifierProvider<LoginController>(
        create: (context) => LoginController(),
        builder: (context, child) {
          return Column(
            children: [
              /// username
              _textFieldUserIdWidget(),

              /// password
              _textFieldPasswordWidget(),

              /// btn
              _loginBtn()
            ],
          );
        },
      ),
    ));
  }

  Widget _textFieldUserIdWidget() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: TextField(
          controller: context.watch<LoginController>().usernameController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(20.0),
            hintText: "username",
          ),
        ),
      ),
    );
  }

  Widget _textFieldPasswordWidget() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: TextField(
          controller: context.watch<LoginController>().passwordController,
          obscureText: context.watch<LoginController>().passwordVisible,
          onChanged: (value) {
            log('xxxx ${context.read<LoginController>().passwordController.text}');
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () =>
                  context.read<LoginController>().passwordVidibleFuntion(),
              icon: context.watch<LoginController>().passwordVisible
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(20.0),
            hintText: "password",
          ),
        ),
      ),
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
      child: const Text('LOGIN'),
      onPressed: () {
        context.read<LoginController>().fetchLogin().then((value) {
          if (value.token != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(value.token ?? "error"),
              ),
            );

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                  create: (context) => HomePageController(),
                  child: HomeScreePage(
                    token: value.token,
                  ),
                ),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(value.message ?? "error"),
              ),
            );
          }
        });
      },
    );
  }
}
