import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview/helper/commonfunction.dart';
import 'package:flutter_interview/helper/constant.dart';
import 'package:flutter_interview/module/home_screen.dart';
import 'package:flutter_interview/module/signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isShowPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(ImageConstant.build),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Login Account",
                    style: TextStyle(
                      color: Colors.amber[800],
                      fontSize: 18,
                      shadows: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 10,
                            offset: const Offset(-1, 1))
                      ],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Please login with registered account",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: emailController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    style: const TextStyle(fontSize: 16),
                    cursorHeight: 20,
                    cursorColor: const Color.fromARGB(255, 242, 190, 190)
                        .withOpacity(0.8),
                    decoration: InputDecoration(
                        hintText: "Email id",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, top: 14, bottom: 14, right: 10),
                          child: Image.asset(
                            ImageConstant.callIcon,
                            color: Colors.amber[800],
                            height: 16,
                            width: 16,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: passwordController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    style: const TextStyle(fontSize: 16),
                    cursorHeight: 20,
                    cursorColor: const Color.fromARGB(255, 242, 190, 190)
                        .withOpacity(0.8),
                    obscureText: isShowPassword,
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, top: 14, bottom: 14, right: 10),
                          child: Image.asset(
                            ImageConstant.keyIcon,
                            height: 16,
                            width: 16,
                          ),
                        ),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              isShowPassword = !isShowPassword;
                              setState(() {});
                            },
                            child: isShowPassword
                                ? Icon(
                                    Icons.visibility,
                                    color: Colors.amber[800],
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: Colors.amber[800],
                                  )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 12,
                        shadows: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 10,
                              offset: const Offset(-1, 1))
                        ],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(emailController.text) &&
                          passwordController.text.trim().isNotEmpty) {
                        loginApi();
                      }
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.6),
                              blurRadius: 5)
                        ],
                        borderRadius: BorderRadius.circular(30),
                        color:
                            RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                        .hasMatch(emailController.text) &&
                                    passwordController.text.trim().isNotEmpty
                                ? Colors.amber[800]
                                : Colors.grey[400],
                      ),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignupScreen()));
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.7),
                              blurRadius: 5)
                        ],
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[400],
                      ),
                      child: const Center(
                        child: Text(
                          "Create account",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  loginApi() async {
    showDialogMethod(context);
    Dio dio = Dio();

    final formData = FormData.fromMap({
      'email': emailController.text,
      'password': passwordController.text,
    });
    final response = await dio.post(
      'https://propertybeehive.hackberrysoftech.com/api/userLogin',
      data: formData,
    );
    hideDialogMethod(context);
    if (response.statusCode == 200 && response.data['isSuccess']) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("${response.data['message']}")));
    }
  }
}
