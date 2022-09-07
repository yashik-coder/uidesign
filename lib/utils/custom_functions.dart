import 'package:intl/intl.dart';

String formatCurrency(num amount, {int decimalCount = 0}) {
  //final formatCurrency = new NumberFormat.simpleCurrency(decimalDigits: decimalCount);

  // var formatCurrency = NumberFormat.currency(locale: 'HI');

  final indianRupeesFormat = NumberFormat.currency(
    name: "INR",
    locale: 'en_IN',
    decimalDigits: 0, // change it to get decimal places
    symbol: '₹ ',
  );

  //print(indianRupeesFormat.format(100000000)); //10,00,00,000.00

  return indianRupeesFormat.format(amount);
}
