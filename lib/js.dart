@JS()
library gs1_parser;

import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';
import 'package:js/js.dart';
import 'dart:convert';

@JS('parseGS1Barcode')
external set _parseGS1Barcode(Function func);

void main() {
  _parseGS1Barcode = allowInterop((String barcode) {
    final parser = GS1BarcodeParser.defaultParser();
    final result = parser.parse(barcode);
    return jsonEncode(
      result.elements.values.map((e) {
        return {
          "ai": e.aiCode,
          "raw": e.rawData,
          "data": e.data,
          "title": AI.AIS[e.aiCode]!.dataTitle,
        };
      }).toList(),
      toEncodable: (nonEncodable) {
        if (nonEncodable is DateTime) {
          return nonEncodable.toIso8601String();
        } else {
          return nonEncodable;
        }
      },
    );
  });
}
