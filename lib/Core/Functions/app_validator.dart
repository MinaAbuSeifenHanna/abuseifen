import '../Constants/regx_constants.dart';

class AppValidator {
  static bool isEmail(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    }
    final exp = RegExp(RegxConstants.emailPattern);
    return exp.hasMatch(email);
  }

  static bool isEnglishInput(String? input) {
    if (input == null || input.isEmpty) return false;
    final exp = RegExp(RegxConstants.english);

    return exp.hasMatch(input);
  }

  static bool containsNumeric(String? input) {
    if (input == null || input.isEmpty) return false;
    final exp = RegExp(RegxConstants.numericRegex);
    return exp.hasMatch(input);
  }

  static bool containsSpecialCharacter(String? input) {
    if (input == null || input.isEmpty) return false;
    final exp = RegExp(RegxConstants.symbolRegex);
    return exp.hasMatch(input);
  }

  static bool isImage(String? input) {
    if (input == null || input.isEmpty) return false;
    final exp = RegExp(RegxConstants.imageRegex);
    return exp.hasMatch(input);
  }

  static bool isAudio(String? input) {
    if (input == null || input.isEmpty) return false;
    final exp = RegExp(RegxConstants.audioRegex);
    return exp.hasMatch(input);
  }

  static bool isVideo(String? input) {
    if (input == null || input.isEmpty) return false;
    final exp = RegExp(RegxConstants.videoRegex);
    return exp.hasMatch(input);
  }

  static bool isPassword(String? input) {
    if (input == null || input.isEmpty) return false;
    final exp = RegExp(RegxConstants.english);
    return exp.hasMatch(input);
  }
}
