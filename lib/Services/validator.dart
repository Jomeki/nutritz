
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
  static String? textFieldValidator(String? text,String inputname) {
    if (text!.isEmpty) {
      return 'Field cannot be empty, Please enter '+inputname;
    }else{
      if(text.length < 4){
        return 'Name cannot be less than 4 characters';
      }
    }
    return null;
  }

  ///Function to validate a text field to only contain numbers
  static String? numberValidator(String? text,String name) {
    RegExp numbers = RegExp('^[0-9]+\$');
    if (text!.isEmpty) {
      return 'Field cannot be empty, Please enter '+name;
    } else if (!numbers.hasMatch(text)) {
      return 'Enter a Number Value';
    }
    return null;
  }

  ///Function to validate phone numbers
  static String? validNumber(String input) {
    RegExp regex = RegExp(r'^(07|06)\d{8}$');

    if(input.isNotEmpty){
      if(regex.hasMatch(input)){
        return null;
      }else{
        return 'Please Enter a valid Phone Number (i.e Starting with 07/6)';
      }
    }else{
      return 'Fiield cannot be empty, Please enter valid Phone number';
    }
  }

  ///check password input validity
  static String? passValidator(String input) {
    if(input.isNotEmpty){
      if(input.length >= 8){
        return null;
      }else{
        return 'Password cannot be less than 8 characters';
      }
    }else{
      return 'Field cannot be empty, Password cannot be empty';
    }
  }

  ///Cheking dropdown value validity
  static String? isDropdownValid(dynamic value,String name) {
    if(value != null){
      return null;
    }else{
    return 'Field cannot be empty, Please enter '+name;
    }
  }

  ///code to check date input
  static String? isDateValid(DateTime selectedDate) {
    DateTime currentDate = DateTime.now();
    DateTime minValidDate = DateTime(currentDate.year - 10, currentDate.month, currentDate.day);

    if(selectedDate != null) {
        if(!(selectedDate.isBefore(minValidDate))){
          return "You cannot enter age below 10 year";
        }else{
          return null;
        }
    }else{
          return "Date cannot be empty";
    }
  }

}
