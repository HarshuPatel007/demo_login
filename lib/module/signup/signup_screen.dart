import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview/helper/commonfunction.dart';
import 'package:flutter_interview/helper/constant.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
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
                    "Create Account",
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
                    "Start learning with create your account",
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
                    controller: nameController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    style: const TextStyle(fontSize: 16),
                    cursorHeight: 20,
                    cursorColor: const Color.fromARGB(255, 242, 190, 190)
                        .withOpacity(0.8),
                    decoration: InputDecoration(
                        hintText: "Name",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, top: 14, bottom: 14, right: 10),
                          child: Image.asset(
                            ImageConstant.userIcon,
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
                    controller: emailController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    style: const TextStyle(fontSize: 16),
                    cursorHeight: 20,
                    cursorColor: const Color.fromARGB(255, 242, 190, 190)
                        .withOpacity(0.8),
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, top: 14, bottom: 14, right: 10),
                          child: Image.asset(
                            ImageConstant.mail,
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
                    height: 20,
                  ),
                  TextField(
                    controller: cpasswordController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    style: const TextStyle(fontSize: 16),
                    cursorHeight: 20,
                    cursorColor: const Color.fromARGB(255, 242, 190, 190)
                        .withOpacity(0.8),
                    obscureText: isShowPassword,
                    decoration: InputDecoration(
                        hintText: "Confirm Password",
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
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      selectImages();
                    },
                    child: Column(
                      children: [
                        const Align(
                            alignment: Alignment.center,
                            child: Icon(Icons.cloud)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Drag & Drop files or ",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Browse",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.amber[800],
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
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
                        //sign up
                        signupApi();
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
                        color: nameController.text.trim().isNotEmpty &&
                                RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                    .hasMatch(emailController.text) &&
                                passwordController.text.trim().isNotEmpty &&
                                cpasswordController.text.trim().isNotEmpty &&
                                passwordController.text ==
                                    cpasswordController.text
                            ? Colors.amber[800]
                            : Colors.grey[400],
                      ),
                      child: const Center(
                        child: Text(
                          "Create account",
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {});
  }

  List images = [];

  signupApi() async {
    showDialogMethod(context);
    Dio dio = Dio();

    for (int i = 0; i < imageFileList!.length; i++) {
      images.add(
        await MultipartFile.fromFile(imageFileList![i].path,
            filename: Random().nextInt(100).toString()),
      );
    }

    final formData = FormData.fromMap({
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'image[]': images,
    });
    final response = await dio.post(
      'https://propertybeehive.hackberrysoftech.com/api/userRegistration',
      data: formData,
    );
    hideDialogMethod(context);
    if (response.statusCode == 200) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("${response.data['message']}")));
    }
  }
}
