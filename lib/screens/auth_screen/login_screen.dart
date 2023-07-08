import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:irish_driving_admin/screens/dashboard/main_screen.dart';
import 'package:irish_driving_admin/widgets/buttons.dart';
import 'package:irish_driving_admin/widgets/colors.dart';
import 'package:irish_driving_admin/widgets/textfield.dart';
import 'package:irish_driving_admin/widgets/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;
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
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : JoinButton(
                    onPressed: () {
                      if (emailController.text.isEmpty &&
                          passController.text.isEmpty) {
                        showSnakBar("Both Fields are Required", context);
                      } else if (passController.text.isEmpty) {
                        showSnakBar("Password Field are Required", context);
                      } else if (passController.text.length < 5) {
                        showSnakBar("Password minimum 5 charaters", context);
                      } else if (emailController.text != 'admin@gmail.com' &&
                          passController.text != '123456') {
                        showSnakBar("Email and password is wrong", context);
                      } else if (emailController.text == 'admin@gmail.com' &&
                          passController.text == '123456') {
                        setState(() {
                          _isLoading = true;
                        });
                        FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passController.text,
                        );
                        setState(() {
                          _isLoading = false;
                        });

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => MainScreen()));
                      } else if (emailController.text != 'admin@gmail.com') {
                        showSnakBar("Email is wrong", context);
                      } else if (passController != '123456') {
                        showSnakBar("Password is wrong", context);
                      }
                    },
                    title: "Login",
                  ),
          )
        ],
      ),
    );
  }
}
