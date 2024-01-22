class Validator {
  static String? validatePassword(String? value) {
    if (value == null || value == "") {
      return "Password is required field";
    } else if (value.length < 6) {
      return "Password length should be at least 8 character.";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value == "") {
      return "Email is required field";
    } else if (value.length < 6) {
      return "Invalid Email";
    } else if (!value.contains('@') || !value.contains('.')) {
      return 'Invalid Email';
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value == "") {
      return "Username is required field";
    } else if (value.length < 3) {
      return "Invalid Username";
    } else if (value.contains(RegExp(r'[^$*.[]{}()?-"!@#%&/\,><:;~`+=]'))) {
      return 'Invalid Username symbol';
    }
    return null;
  }
}
