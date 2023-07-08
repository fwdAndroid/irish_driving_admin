import 'package:flutter/material.dart';
import 'package:irish_driving_admin/widgets/buttons.dart';
import 'package:irish_driving_admin/widgets/colors.dart';
import 'package:irish_driving_admin/widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/logo.png",
            height: 200,
            fit: BoxFit.cover,
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 15, right: 15),
            child: TextFormInputField(
                preIcon: IconButton(onPressed: () {}, icon: Icon(Icons.email)),
                controller: emailController,
                hintText: "Enter Your Email",
                textInputType: TextInputType.emailAddress),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 15, right: 15),
            child: TextFormInputField(
                preIcon: IconButton(
                  onPressed: _toggle,
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                ),
                isPass: _obscureText,
                controller: passController,
                hintText: "Enter Your Password",
                textInputType: TextInputType.visiblePassword),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 15, right: 15),
            child: JoinButton(
              onPressed: () {},
              title: "Login",
            ),
          )
        ],
      ),
    );
  }
}
