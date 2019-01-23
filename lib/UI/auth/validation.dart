import 'package:flutter/material.dart';
import 'package:validate/validate.dart';

class Validation {
  static String isValidEmail(String email, BuildContext context) {
    try {
      Validate.isEmail(email);
    } catch (e) {
      return "Please Enter Valid Email";
    }
    return null;
  }

  static String isValidPassword(String password, BuildContext context) {
    if (password.length < 6) return "Please Enter Strong Password";

    return null;
  }

  static String isValidCity(String password, BuildContext context) {
    if (password.length < 3) return "Please Enter Valid City";

    return null;
  }

  static String isValidLocation(String password, BuildContext context) {
    if (password.length < 3) return "Please Enter Valid Location";

    return null;
  }

  static String isValidUsername(String username, BuildContext context) {
    if ((username.length > 30) || (username.length < 3) || username.isEmpty) {
      return "Please Enter Valid Username";
    }
//    try {
//      Validate.isAlphaNumeric(username);
//    } catch (e) {
//      return "Please Enter Valid Username";
//    }
    return null;
  }

  // TODO : Better Way of checking Phone Number
  // we are just checking if numbers and if length
  static String isValidPhone(String phoneNum, BuildContext context) {
    if ((phoneNum.length != 11) || phoneNum.isEmpty) {
      return "Please Enter Valid Phone Number";
    }
    try {
      Validate.isAlphaNumeric(phoneNum);
    } catch (e) {
      return "Please Enter Valid Phone Number";
    }
    return null;
  }
}
