import 'package:flutter/material.dart';
import 'package:mobile_document/components/messageHepler.dart';
import 'package:mobile_document/provider/auth_provider.dart';
import 'package:mobile_document/view/auth/Register.dart';
import 'package:provider/provider.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  bool eye = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Forgot Page",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Center(
                    child: Container(
                      height: 50,
                      width: size.width / 1.1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                            spreadRadius: 0,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: auth.email,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          hintText: "example@gmail.com",
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Text(
                    "New Password",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Center(
                    child: Container(
                      height: 50,
                      width: size.width / 1.1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                            spreadRadius: 0,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        obscureText: eye,
                        controller: auth.newPassword,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          hintText: "xxxxxxxx",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                eye = !eye;
                              });
                            },
                            icon: Icon(Icons.remove_red_eye),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Text(
                    "Confirm Password",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Center(
                    child: Container(
                      height: 50,
                      width: size.width / 1.1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                            spreadRadius: 0,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        obscureText: eye,
                        controller: auth.password,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          hintText: "xxxxxxxx",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                eye = !eye;
                              });
                            },
                            icon: Icon(Icons.remove_red_eye),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: GestureDetector(
                      onTap: () {
                        if (auth.email.text.isEmpty) {
                          MessageHelper.showSnackBarMessage(
                            isSuccess: false,
                            message: "email is required!",
                          );
                        } else if (auth.newPassword.text.isEmpty) {
                          MessageHelper.showSnackBarMessage(
                            isSuccess: false,
                            message: "new password is required!",
                          );
                        } else if (auth.password.text !=
                            auth.newPassword.text) {
                          MessageHelper.showSnackBarMessage(
                            isSuccess: false,
                            message: "password not match",
                          );
                        } else {
                          auth.Forgot();
                        }
                      },
                      child: Container(
                        height: 50,
                        width: size.width / 1.1,
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child:
                              auth.loading == true
                                  ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                  : Text(
                                    "Save",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
