import 'package:aone_common/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  
  test('decimalString test with double', () {
    var answer = decimalString(123.93238894);
    expect(answer, '123.93');
  });

  test('decimalString test with string', () {
    var answer = decimalString('48493.232352');
    expect(answer, '48493.23');
  });

  test('decimalString test with int', () {
    var answer= decimalString(3323);
    expect(answer, '3323.00');
  });

  test('decimalString test with unexpected type (boolean)', () {
    var answer = decimalString(false);
    expect(answer, '--');
  });

  test('decimalString test with larger decimals', () {
    var answer = decimalString('323.3338483923', 4);
    expect(answer, '323.3338');
  });

  test('decimalString test with auto fill for blank decimals', () {
    var answer = decimalString('323.10', 4);
    expect(answer, '323.1000');
  });
}