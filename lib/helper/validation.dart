class Validation {
  // Name text field validation
  static titleValidation(String? value) {
    if (value!.trim().isEmpty) {
      return "Enter Title";
    }
  }

  static descriptionValidation(String? value) {
    if (value!.trim().isEmpty) {
      return "Enter Description";
    }
  }
}
