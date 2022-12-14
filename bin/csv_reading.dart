import 'dart:io';

import 'package:csv_reading/csv_reading.dart' as csv_reading;

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print("Usage: csv_reading path/to.csv\n");
    exit(1);
  }
  final path = arguments[0];

  final lines = csv_reading.readCsvSync(path);
  lines?.forEach((element) => print(element));
}
