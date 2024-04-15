import 'package:money_formatter/money_formatter.dart';

class Format{
  static String formatMoney(String money){
    MoneyFormatterOutput  fmf = MoneyFormatter(
        amount: double.parse(money),
        settings: MoneyFormatterSettings(
            symbol: 'đ',
            thousandSeparator: '.',
            decimalSeparator: ',',
            symbolAndNumberSeparator: ' ',
            fractionDigits: 0,
        )
    ).output;

    return fmf.symbolOnRight;
  }

  static String formatDateTime(DateTime dateTime){
    String formattedDate = '${dateTime.day.toString().padLeft(2, '0')}/'
        '${dateTime.month.toString().padLeft(2, '0')}/'
        '${dateTime.year} ${dateTime.hour.toString().padLeft(2, '0')}:'
        '${dateTime.minute.toString().padLeft(2, '0')}:'
        '${dateTime.second.toString().padLeft(2, '0')}';
    return formattedDate;
  }
}

class Validation {
  static bool isValidIdNumber(String idNumber) {
    final numberRegex = RegExp(r'^[0-9]+$');
    return numberRegex.hasMatch(idNumber.trim()) &&
        isValidIdNumberLength(idNumber.trim()) &&
        !isContainSpace(idNumber);
  }

  static bool isValidName(String name) {
    final validCharacters = RegExp(r'^[a-zA-Z\sÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễếệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$');
    if (!validCharacters.hasMatch(name.trim()) || name.trim() != name) {
      return false;
    }
    return true;
  }

  static bool isValidIdNumberLength(String idNumber) {
    return idNumber.trim().length == 9 || idNumber.trim().length == 12;
  }

  static bool isContainSpace(String string) {
    return string.contains(' ');
  }

  static bool isValidEmail(String email){
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
