
import 'package:excelledia_design/view/utils/common/validchecking.dart';

class SimpleFunctions {
  SimpleFunctions();
  static String? emailValidator(String? email) {
    if (email!.isValidEmail) {
      return null;
    } else {
      return 'Please enter a valid email id';
    }
  }

  static String? mobileNumberValidator(String? number) {
    if (number!.isValidPhone) {
      return null;
    } else {
      return 'Please enter a valid phone number';
    }
  }

  static String? nameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return 'Please enter a valid name';
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? name) {
    if (name == null || name.isEmpty) {
      return 'Please enter a valid password';
    } else {
      return null;
    }
  }

  static String? otp(String? name) {
    if (name == null || name.isEmpty) {
      return '';
    } else {
      return null;
    }
  }

  static String? passWordValidatorLogin(String? password) {
    if (password!.length < 6) {
      return "Password is invalid";
    } else {
      return null;
    }
  }

  static String? passWordValidator(String? password) {
    // if (this.length < 6) {
    //   return "Password must be atleast 6 characters";
    // }
    // if (password == null || password.isEmpty) {
    //   return 'Password is invalid';
    // }
    if (password!.length < 6) {
      return "Password must be atleast 8 characters";
    } else {
      return null;
    }
  }

  static String? confrimPasswordValidator(String? confirmPass) {
    if (confirmPass != null) {
      return 'Passwords are not matching';
    } else {
      return null;
    }
  }

  /*static String? userNameValidator(String? userName) {
    if (userName == null || userName.isEmpty) {
      return 'Username should not be empty';
    } else if (!userName.isValidUserName) {
      return 'Username is Invalid';
    } else {
      return null;
    }
  }*/

  static String? emptyFieldValidator(String? field) {
    if (field == null || field.isEmpty) {
      return 'Field should not be empty';
    } else {
      return null;
    }
  }
}
