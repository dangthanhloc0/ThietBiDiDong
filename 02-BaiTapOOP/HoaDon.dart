import 'CheckValidate.dart';
import 'DienThoai.dart';
import 'KhachHang.dart';

class Hoadon {
  String MaHD;
  DateTime NgayBan;
  DienThoai DT;
  int SoLuong;
  double GiaBanThucTe;
  Khachhang KH;
  Checkvalidate validate = new Checkvalidate();

  Hoadon(
    this.MaHD,
    this.NgayBan,
    this.DT,
    this.SoLuong,
    this.GiaBanThucTe,
    this.KH,
  );

  // Getter
  String get _MaHD => MaHD;
  DateTime get _NgayBan => NgayBan;
  int get _SoLuong => SoLuong;
  double get _GiaBanThucTe => GiaBanThucTe;
  Khachhang get _Kh => KH;
  DienThoai get _DT => DT;

  // Setter
  set _MaHD(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Mã điện thoại không được rỗng');
    }
    String checkResult = validate.CheckFM(value, "HD");
    if (checkResult == "") {
      throw ArgumentError(checkResult);
    }
    MaHD = value;
  }

  set _SoLuong(int value) {
    if (value <= 0) {
      throw ArgumentError("Số lượng mua phải nhiều hơn 0 ");
    }
    if (value > DT.SLTK) {
      throw ArgumentError("Số lượng mua phải <= số lượng tồn");
    }
    SoLuong = value;
  }

  set _GiaBan(double value) {
    if (GiaBanThucTe > 0) {
      throw ArgumentError("Giá bán thực tế phải lơn hơn 0 ");
    }
    GiaBanThucTe = value;
  }

  set _DT(DienThoai value) {
    DT = value;
  }

  // tính tổng tiền
  double get TongTien => SoLuong * GiaBanThucTe;
  // tinh lợi nhuận
  double LoiNhuanThucTe(double GiaN) => TongTien - GiaN * SoLuong;
  // hiển thị thông tin
  void HienThi() {
    print("MaHD : $MaHD");
    print("Ngày Bán : $NgayBan");
    print("DT :${DT.HienThi()}");
    print("Số lượng $SoLuong");
    print("Giá bán thực tế : $SoLuong");
    print("Khách hàng : ${KH.HienThi()}");
  }
}
