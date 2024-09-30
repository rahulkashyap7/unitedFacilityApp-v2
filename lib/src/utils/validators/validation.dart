
class UflValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty){
      return 'Email is required.';
    }

  //   Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty){
      return 'Password is required.';
    }

  //   Check minimum password length
    if(value.length < 6) {
      return 'Password must be at least 6 character log';
    }


    // Adding Employee code validation

    return null;
  }
}