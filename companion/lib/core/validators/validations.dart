import 'package:easy_localization/easy_localization.dart';

class AppValidations {

  static bool emailRegExp(email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  static emailValidation(String email) => email.isEmpty
      ? 'PleaseEnterEmail'.tr()
      : !emailRegExp(email)
          ? 'PleaseEnterValidEmail'.tr()
          : null;
  static nameValidation(String name) => name.isEmpty
      ? ('${'PleaseEnter'.tr()} ${'FullName'.tr()}')
      : name.length < 3
          ? 'name_is_short'.tr()
          : !RegExp(r"^[a-zA-Z0-9-\u0621-\u064A0]").hasMatch(name)
              ? 'PleaseValidName'.tr()
              : null;

    static generalValidation(String ? name) => name==null?
       ("please_enter_this_field".tr())
      : 
               null;

  static password(String password) => password.isEmpty
      ? 'PleaseEnterPassword'.tr()
      : password.length < 8
          ? 'pleaseEnterValidPassword'.tr()
          : null;
   static confirmPasswordvalidation(String password, String confirmPassword) =>
      confirmPassword.isEmpty
          ? 'PleaseEnterPassword'.tr()
          : password != confirmPassword
              ? 'passwordNotMatched'.tr()
              : null;
  static phoneValidation(String phone) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (phone.isEmpty) {
      return '${'PleaseEnter'.tr()}  ${'phone'.tr()}';
    } else if (!regExp.hasMatch(phone)) {
      return 'PleaseEnterValidPhone'.tr();
    }
  }
}

  






