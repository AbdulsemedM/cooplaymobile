import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:protest/Forgot_pw.dart';
import 'package:protest/HomePage.dart';
import 'package:protest/Signup.dart';
import 'package:protest/colors.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class Login_page extends StatefulWidget {
  @override
  _Login_pageState createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  bool _passwordVisible = false;
  DateTime timeBackPressed = DateTime.now();
  TextEditingController pnumber = TextEditingController();
  TextEditingController password = TextEditingController();
  Color circularColor = Colors_selector.pair1;
  final List locale = [
    {'name': 'English', 'locale': Locale('en', 'US')},
    {'name': 'Afaan Oromoo', 'locale': Locale('or', 'ET')},
    {'name': 'አማርኛ', 'locale': Locale('am', 'ET')},
    {'name': 'Somali', 'locale': Locale('en', 'US')},
  ];
  login() async {
    // String pn = pnumber.text;

    // if (pnumber.text.length != 10 ||
    //     pn[0] + pn[1] != "09" ||
    //     pnumber.text == "") {
    //   const message = 'Invalid phone number format';
    //   Future.delayed(const Duration(milliseconds: 100), () {
    //     Fluttertoast.showToast(msg: message, fontSize: 18);
    //   });
    // } else {
    //   setState(() {
    //     circularColor = Colors_selector.secondaryColor;
    //   });
    //   final body =
    //       jsonEncode({"username": pnumber.text, "password": password.text});
    //   var response = await http.post(Uri.http("localhost:8080", "/login"),
    //       headers: {"Content-Type": "application/json"}, body: body);

    //   if (response.statusCode == 200) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
    //     setState(() {
    //       circularColor = Colors_selector.pair1;
    //     });
    //   } else {
    //     setState(() {
    //       circularColor = Colors_selector.pair1;
    //     });
    //     const message = 'Invalid PhoneNumber or Password';
    //     Fluttertoast.showToast(msg: message, fontSize: 18);
    //   }
    //   print(response.body);
    // }
  }
  //Map<String, String> headers = {"Content-Type": "application/json"};

  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('Choose Language'),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(locale[index]['name']),
                        onTap: () {
                          print(locale[index]['locale']);
                          updateLanguage(locale[index]['locale']);
                          // await prefs.setBool('repeat', true);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  updateLanguage(Locale locale) async {
    Get.back();
    Get.updateLocale(locale);
    // final SharedPreferences prefs = await _prefs;
    // if (locale == 'am_Et') {
    //   await prefs.setBool('isAmharic', true);
    //   await prefs.setBool('isOromiffa', false);
    // }
    // if (locale == 'en_US') {
    //   await prefs.setBool('isAmharic', false);
    //   await prefs.setBool('isOromiffa', false);
    // }
    // if (locale == 'or_ET') {
    //   await prefs.setBool('isAmharic', false);
    //   await prefs.setBool('isOromiffa', true);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= Duration(seconds: 2);
        timeBackPressed = DateTime.now();
        if (isExitWarning) {
          final message = 'press again to exit';
          Fluttertoast.showToast(msg: message, fontSize: 18);

          return false;
        } else {
          Fluttertoast.cancel();
          exit(0);
          return true;
        }
      },
      child: Scaffold(
        // backgroundColor: Colors.cyan,
        body: SafeArea(
          // MainAxisAlignment:MainAxisAlignment.center,
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors_selector.pair1,
                    Colors_selector.pair2
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  child: Column(children: <Widget>[
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: (() {
                        buildLanguageDialog(context);
                      }),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(280, 2, 10, 2),
                            child: Text("Languages".tr),
                          ),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                    SizedBox(height: 60),
                    Center(
                      child: Image.asset(
                        'assets/images/Cap.png',
                        height: 200,
                        width: 400,
                      ),
                    ),
                    // SizedBox(height: 10),
                    // SizedBox(height: 10),
                    // Center(
                    //   child: Text(
                    //     "Welcome to CooPlay",
                    //     style: TextStyle(
                    //       fontSize: 25,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 10),
                    Text(
                      "Login".tr,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors_selector.primaryColor,
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors_selector.tertiaryColor,
                            border: Border.all(
                                color: Colors_selector.tertiaryColor),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            controller: pnumber,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone_android),
                                border: InputBorder.none,
                                // hintText: "Phone Number",
                                labelText: "Phone Number".tr),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors_selector.tertiaryColor,
                            border: Border.all(
                                color: Colors_selector.tertiaryColor),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            controller: password,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  // tooltip: "show password",
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                border: InputBorder.none,
                                // hintText: "Password",
                                labelText: "Password".tr),
                            //                      suffixIcon: IconButton(
                            // icon: Icon(
                            //   // Based on passwordVisible state choose the icon
                            //    _passwordVisible
                            //    ? Icons.visibility
                            //    : Icons.visibility_off,
                            //    color: Theme.of(context).primaryColorDark,
                            //    ),
                            // onPressed: () {
                            //    // Update the state i.e. toogle the state of passwordVisible variable
                            //    setState(() {
                            //        _passwordVisible = !_passwordVisible;
                            //    });
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Forgot_pw()),
                              );
                            },
                            child: Text(
                              "Forgot".tr,
                              style: TextStyle(
                                  color: Colors_selector.secondaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 5),
                      child: GestureDetector(
                        onTap: () {
                          login();
                        },
                        child: Container(
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color: Colors_selector.primaryColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "Login".tr,
                              style: TextStyle(
                                  color: Colors_selector.tertiaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ))),
                      ),
                    ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Icon(Icons.login),
                    //   color: Colors.deepOrangeAccent[700],
                    //   iconSize: 40,
                    // ),
                    CircularProgressIndicator(
                      color: circularColor,
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 120),
                      child: Row(
                        children: [
                          Text("Don't have an account? ".tr,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup()),
                              );
                            },
                            // Change button text when light changes state.
                            child: Text(
                              "Signup here".tr,
                              style: TextStyle(
                                  color: Colors_selector.primaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 80),
                    Text(
                      "copyright 1894-2023 © Coop Bank of Oromia",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 10),
                    Text("All Rights Reserved")
                    // SizedBox(height: 119),
                  ]),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
