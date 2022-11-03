A sample command-line application explaining how to read CSV files in Dart programming language.

---

Here are few branches describing different ways of reading CSV files in Dart:

- `main` - simple reading in sync mode
- `async_read` - simple reading all lines but in async mode
- `async_read_stream` - more complex reading by using stream and stream transformers


### Example call
```
$ dart run bin/csv_reading.dart path/to/motors.csv
id, title, type, count
1, 'Citroen C3', Car, 2
2, 'BMW K1600 GTL', Motorcycle, 4
3, 'Dodge Ram', Truck, 1
4, 'Polestar P1', Car, 3
5, 'Ford F50', Truck, 1
6, 'KIA K9', Car
```
