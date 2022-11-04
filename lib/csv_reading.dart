import 'dart:convert';
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

// Wrap response in a `Future` object and mark function as `async`
Future<List<String>?> readCsv(String path) async {
  // Create `File` object
  final file = File(path);
  // Check if file is ready to be read :)
  if (!await file.exists()) {
    return null;
  }

  // Read lines sync and return them.
  return await File(path).readAsLines();
}

Stream<List<dynamic>> streamCsv(String path,
    {String delimeter = ',', String quotechar = '\''}) async* {
  // Create `File` object
  final file = File(path);
  // Check if file is ready to be read :)
  if (!await file.exists()) {
    return;
  }

  final stream =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());
  await for (String row in stream) {
    final items = row.split(delimeter);

    final values = items.map((element) {
      element = element.trim();

      var dval = int.tryParse(element);
      if (dval != null) return dval;

      var ival = double.tryParse(element);
      if (ival != null) return ival;

      if (element.startsWith(quotechar) && element.endsWith(quotechar)) {
        element = element.substring(1, element.length - 1);
      }
      return element;
    });

    yield values.toList();
  }
}
