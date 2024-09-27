// validation.dart

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  final regex = RegExp(emailPattern);
  if (!regex.hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}

String? validateMobile(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your mobile number';
  }
  const mobilePattern = r'^\d{10}$'; // Example for 10-digit mobile number
  final regex = RegExp(mobilePattern);
  if (!regex.hasMatch(value)) {
    return 'Please enter a valid mobile number';
  }
  return null;
}
