class Checkvalidate {
  Checkvalidate();
  String CheckFM(String value, String Ma) {
    switch (Ma) {
      case "DT":
        {
          if (value[0] != "D") {
            return "Kí tự đầu tiên phải là D";
          }
          if (value[1] != "T") {
            return "Kí tự thứ 2 phải là T";
          }
          break;
        }
      case "HD":
        {
          if (value[0] != "H") {
            return "Kí tự đầu tiên phải là H";
          }
          if (value[1] != "D") {
            return "Kí tự thứ 2 phải là D";
          }
          break;
        }
      default:
        return "Không tìm thấy mã hợp lệ";
    }

    if (value[2] != "-") {
      return "Kí tự thứ 3 phải là -";
    }
    for (int i = 3; i < value.length; i++) {
      if (int.tryParse(value[i]) == false) {
        return "Kí tự từ thứ 4 phải là số";
      }
    }
    if (value.isEmpty) {
      return "value không được để trống";
    }

    return "";
  }

  bool CheckvalidatePhoneNumber(String phoneNumber) {
    final RegExp phoneRegex = RegExp(r'^(0[3|5|7|8|9])[0-9]{8}$');

    return phoneRegex.hasMatch(phoneNumber);
  }
}
