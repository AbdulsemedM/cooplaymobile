import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthController {
  TextEditingController pnumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  TextEditingController rcodeController = TextEditingController();

  Future loginUser() async {
    const url = 'http://10.0.2.2:8080/login';

    var response = await http.post(Uri.parse(url),
        body: jsonEncode({
          "phoneNumber": pnumberController.text,
          "password": passwordController.text,
        }));
    if (response.statusCode == 200) {
      var loginArr = json.decode(response.body);
      // save this token in shared prefrences and make user logged in and navigate

      print(loginArr['token']);
    } else {
      print("invalid login");
    }
  }

  Future Signup() async {
    const url = 'http://10.0.2.2:8080/login';
    var response = await http.post(Uri.parse(url),
        body: jsonEncode({
          "fname": fnameController.text,
          "lname": lnameController.text,
          "phoneNumber": pnumberController.text,
          "cpassword": cpasswordController.text,
          "password": passwordController.text,
          "rcode": rcodeController.text
        }));
  }
}
