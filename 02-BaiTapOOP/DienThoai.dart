import 'dart:ffi';

import 'CheckValidate.dart';

class DienThoai {
  String MaDt;
  String TenDT;
  String HangSX;
  double GiaN;
  double GiaB;
  int SLTK;
  bool TT;
  int SLDB;

  Checkvalidate validate = new Checkvalidate();

  DienThoai(
    this.MaDt,
    this.TenDT,
    this.HangSX,
    this.GiaN,
    this.GiaB,
    this.SLTK,
    this.TT,
    this.SLDB,
  );

  // Getter
  String get _MaDt => MaDt;
  String get _TenDT => TenDT;
  String get _HangSX => HangSX;
  double get _GiaN => GiaN;
  double get _GiaB => GiaB;
  int get _SLTK => SLTK;
  bool get _TT => TT;
  int get _SLDB => SLDB;

  // Setter
  set _maDT(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Mã điện thoại không được rỗng');
    }
    String checkResult = validate.CheckFM(value, "DT");
    if (checkResult == "") {
      throw ArgumentError(checkResult);
    }
    MaDt = value;
  }

  set _SLDB(int value) {
    if (value < 0) {
      throw ArgumentError('Số lượng bán phải lớn hơn =  0');
    }

    _SLDB = value;
  }

  set _TenDT(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Tên điện thoại không được rỗng');
    }
    TenDT = value;
  }

  set _HangSX(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Hãng điện thoại không được rỗng');
    }
    HangSX = value;
  }

  set _GiaN(double value) {
    if (value <= 0) {
      throw ArgumentError("Giá nhập phải lơn hơn 0");
    }
    GiaN = value;
  }

  set _GiaB(double value) {
    if (value <= 0) {
      throw ArgumentError("Giá bán phải lơn hơn 0");
    }
    if (GiaN > value) {
      throw ArgumentError("Giá bán phải lớn hơn giá nhập");
    }
    GiaB = value;
  }

  set _SLTK(int value) {
    if (value <= 0) {
      throw ArgumentError("Số lượng tồn kho phải lơn hơn 0");
    }
    SLTK = value;
  }

  set _SL_TTTK(bool value) {
    TT = value;
  }

  // tinh loi nhuan dự kiến
  double TinhLoiNhuan() {
    return GiaB - GiaN;
  }

  // Phuong thuc kiem tra xem có thể bán hay không
  bool KiemTraBan() {
    if (SLTK > 0 && TT == true) {
      return true;
    }
    return false;
  }

  // hiển thị thông tin
  String HienThi() {
    return "Mã điện thoại : $MaDt Tên Điện Thoại : $TenDT Hãng sản xuất : $HangSX Giá Nhập : $GiaN Giá Bán : $GiaB Số lượng tồn kho : $SLTK Trạng thái tồn kho : ${TT ? "Còn kinh doanh" : "Hết kinh doanh"} Số lượng đã bán : $SLDB";
  }
}
