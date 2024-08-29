class InputConverter {
  int stringToUnsignedInteger(String str) {
    final integer = int.tryParse(str);
    if (integer == null || integer < 0) {
      throw const FormatException();
    }
    return integer;
  }
}
