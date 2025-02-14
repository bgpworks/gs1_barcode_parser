@JS()
library gs1_parser;

import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';
import 'package:js/js.dart';

@JS('parseGS1Barcode')
external set _parseGS1Barcode(Function func);

void main() {
  _parseGS1Barcode = allowInterop((String barcode) {
    final parser = GS1BarcodeParser.defaultParser();
    final result = parser.parse(barcode);
    return result.toString();
  });
}
