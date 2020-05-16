class Validators {
  static final RegExp chinaMobilePhoneNumber = RegExp(
      r'^134[0-8]\d{7}$|^(?:13[5-9]|147|15[0-27-9]|178|1703|1705|1706|18[2-478])\d{7,8}$');
  static final RegExp chinaUnicomPhoneNumber = RegExp(
      r'^(?:13[0-2]|145|15[56]|176|167|1704|1707|1708|1709|171|18[56])\d{7,8}$');
  static final RegExp chinaTelecomPhoneNumber = RegExp(
      r'^(?:133|149|153|162|1700|1701|1702|173|177|18[019]|19[0139])\d{7,8}$');
  static final RegExp email = RegExp(r'^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$');

  static bool isPhoneNumber(String text) {
    if (chinaMobilePhoneNumber.hasMatch(text)) {
      return true;
    } else if (chinaUnicomPhoneNumber.hasMatch(text)) {
      return true;
    } else if (chinaTelecomPhoneNumber.hasMatch(text)) {
      return true;
    } else {
      return false;
    }
  }

  static bool isEmail(String text) {
    if (email.hasMatch(text)) {
      return true;
    } else {
      return false;
    }
  }

  static bool isAccount(String text) {
    if (isPhoneNumber(text) || isEmail(text)) {
      return true;
    } else {
      return false;
    }
  }

  static bool isPassword(String text) {
    if (text.length >= 6) {
      return true;
    } else {
      return false;
    }
  }
}
