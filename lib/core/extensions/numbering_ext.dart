import 'package:intl/intl.dart';

extension ThreeDigitFormat on num {
  String format3Digit() {
    final formatter = NumberFormat.decimalPattern(); // default: 1,000
    return formatter.format(this);
  }
}
