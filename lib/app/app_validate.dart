import 'package:flutter/material.dart';
import 'package:temp_package_name/presentation/resource/resource.dart';

class AppValidate {
  AppValidate._();
  static validateEmpty() {
    return (value) {
      if (value == null || value.length == 0) return StringManager.invalidEmpty;
    };
  }

  static validateEmail() {
    return (value) {
      final value1 = value.replaceAll(' ', '');
      if (value1 == null || value1.length == 0) {
        return StringManager.invalidEmpty;
      } else {
        RegExp regex = RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
        if (!regex.hasMatch(value1)) {
          return StringManager.invalidEmail;
        } else {
          return null;
        }
      }
    };
  }

  static validatePassword() {
    return (value) {
      if (value == null || value.length < 6) {
        return StringManager.invalidPassword;
      } else {
        RegExp regex = RegExp(r'^[0-9a-zA-Z!@#\$&*~]{6,}$');
        if (!regex.hasMatch(value)) {
          return StringManager.invalidPassword;
        } else {
          return null;
        }
      }
    };
  }

  static validatePasswordConfirm(TextEditingController controller) {
    return (value) {
      if (controller.text != value) {
        return StringManager.invalidPasswordConfirm;
      } else {
        return null;
      }
    };
  }

  static validatePhoneNumber() {
    RegExp regex = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
    return (value) {
      if (value == null || value.length == 0) {
        return StringManager.invalidEmpty;
      } else if (value.length != 10) {
        return StringManager.invalidPhoneNumber;
      } else if (!regex.hasMatch(value)) {
        return StringManager.invalidPhoneNumber;
      } else {
        return null;
      }
    };
  }

  static validatePhoneOrEmail() {
    return (value) {
      if (value == null || value.length == 0) {
        return StringManager.invalidEmpty;
      }
      RegExp regexPhone = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
      RegExp regexEmail = RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
      if (!regexPhone.hasMatch(value)) {
        if (!regexEmail.hasMatch(value)) return StringManager.invalidEmailOrPhoneNumber;
      }
    };
  }
}
