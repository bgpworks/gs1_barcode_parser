# gs1_barcode_parser

GS1 Barcode parser

## Example

Parse code-128 with FNC1

```dart
    final String barcode =
          ']C101040123456789011715012910ABC1233932971471131030005253922471142127649716';
    final parser = GS1BarcodeParser.defaultParser();
    final result = parser.parse(barcode);
    print(result);
```

Result

```text
    code = GS1-128,
    data = {
    01 (GTIN): 04012345678901,
    17 (USE BY OR EXPIRY): 2015-01-29 00:00:00.000,
    10 (BATCH/LOT): ABC123,
    3932 (PRICE): 47.11,
    3103 (NET WEIGHT (kg)): 0.525,
    3922 (PRICE): 47.11,
    421 (SHIP TO POST): 49716,
    }
```

## Export to Javascript

```sh
dart compile js -o gs1_parser.js lib/js.dart
```
