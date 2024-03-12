
///Class defining Text Field validators depending on the need of use
class InputValidators {
  ///Function used to verify an email using a regular expression to validate the syntax
  // static String? emailValidator(String email) {
  //   if (email.isNotEmpty) {
  //     return EmailValidator.validate(email) ? null : 'Email is required';
  //   }
  //   return null;
  // }

  ///Function used to validate a text field hence preventing empty fields
  static String? textFieldValidator(String? text) {
    if (text!.isEmpty) {
      return 'Field is Required';
    }
    return null;
  }

  ///Function to validate a text field to only contain numbers
  static String? numberValidator(String? text) {
    RegExp numbers = RegExp('^[0-9]+\$');
    if (text!.isEmpty) {
      return 'Field Cannot be empty';
    } else if (!numbers.hasMatch(text)) {
      return 'Enter a Number Value';
    }
    return null;
  }
}
