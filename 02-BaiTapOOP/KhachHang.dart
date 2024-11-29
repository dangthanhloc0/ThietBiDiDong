import 'CheckValidate.dart';

class Khachhang {
  String TenKH;
  String SDT;

  Checkvalidate validate = new Checkvalidate();

  Khachhang(this.TenKH, this.SDT);

  set _TenKH(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Tên khách hàng không được rỗng');
    }
    TenKH = value;
  }

  set _SDT(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Số điện thoại không được rỗng');
    }
    if (!validate.CheckvalidatePhoneNumber(value)) {
      throw ArgumentError('Số điện thoại không hợp lệ');
    }
    SDT = value;
  }

  // hiển thị thông tin
  String HienThi() {
    return "Tên khách hàng : $TenKH \nSố điện thoại : $SDT";
  }
}
