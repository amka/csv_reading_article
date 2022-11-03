import 'dart:io';

List<String>? readCsvSync(String path) {
  // Create `File` object
  final file = File(path);
  // Check if file is ready to be read :)
  if (!file.existsSync()) {
    return null;
  }

  // Read lines sync and return them.
  return File(path).readAsLinesSync();
}
