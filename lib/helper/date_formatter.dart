import 'package:intl/intl.dart';

String getFormattedDate(String? dateTimeString) {
  if (dateTimeString == null) return "";
  // Parse the string into a DateTime object
  final DateTime dateTime = DateTime.parse(dateTimeString);

  // Define the desired format
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  // Format the DateTime object into a string
  return formatter.format(dateTime);
}

String getFormattedTime(String? dateTimeString) {
  if (dateTimeString == null) return "";
  final DateTime dateTime = DateTime.parse(dateTimeString);
  final DateFormat formatter = DateFormat('HH:mm:ss');
  return formatter.format(dateTime);
}
