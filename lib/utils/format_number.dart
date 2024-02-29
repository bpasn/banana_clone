import "package:intl/intl.dart";

class Utils {
  static String formatNumberToString(int n) {
    NumberFormat numberFormat = NumberFormat("#,###", 'th_TH');
    return "฿ ${numberFormat.format(n)}";
  }
}
