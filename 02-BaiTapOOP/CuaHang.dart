import 'dart:ffi';

import 'CheckValidate.dart';
import 'DienThoai.dart';
import 'HoaDon.dart';
import 'KhachHang.dart';

class Cuahang {
  String TenCH;
  String DiaChi;
  List<DienThoai> LDT = [];
  List<Hoadon> LHD = [];
  Checkvalidate validate = new Checkvalidate();
  Cuahang(this.TenCH, this.DiaChi);

  // Getter
  String get _TenCH => TenCH;
  String get _DiaChi => DiaChi;

  // Setter
  set _TenCH(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Tên cửa hàng không được rỗng');
    }
    TenCH = value;
  }

  set _DiaChi(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Địa chỉ không được rỗng');
    }
    DiaChi = value;
  }

  // thêm DT moisws
  void ThemDienThoaiMoi(DienThoai DT) {
    LDT.add(DT);
  }

  // cập nhập thông tin
  void CapNhapThonTinDienThoai(DienThoai DT) {
    int index = LDT.indexWhere((e) => e.MaDt == DT.MaDt);
    if (index != -1) {
      LDT[index] = DT;
    }
  }

  // tìm điện thoại
  DienThoai finDT(String ma, String hang) {
    int index = LDT.indexWhere((e) => e.MaDt == ma && e.HangSX == hang);
    return LDT[index];
  }

  // Ngưng kinh doanh mặt hàng
  void NgungKinhDoanhDienThoai(DienThoai DT) {
    DT.TT = false;
  }

  // Hiện thị danh sách điện thoại
  void hienThiDanhSachDienThoai() {
    print("\nHiện thị danh sách điện thoại\n");
    for (DienThoai item in LDT) {
      print(item.HienThi());
    }
  }

  // tạo hóa đơn mới
  void addHoaDon(Hoadon HD) {
    LHD.add(HD);
    var Dt = finDT(HD.DT.MaDt, HD.DT.HangSX);
    HD.DT.SLTK -= HD.SoLuong;
    HD.DT.SLDB += HD.SoLuong;
  }

  // tìm hóa đơn
  Hoadon finHD(String ma, DateTime Ngay, Khachhang Kh) {
    int index = LHD.indexWhere(
      (e) =>
          e.MaHD == ma &&
          e.NgayBan == Ngay &&
          e.KH.SDT == Kh.SDT &&
          e.KH.TenKH == Kh.TenKH,
    );
    return LHD[index];
  }

  // hiển thị hd
  void HienTthiHd() {
    print("\n\ Hiện thị danh sách hóa đơn\n");
    for (Hoadon item in LHD) {
      item.HienThi();
    }
  }

  // tỉnh tổng doanh thu
  double tinhTongDoanhThu(DateTime ngayBatDau, DateTime ngayKetThuc) {
    double tong = 0;
    for (var item in LHD) {
      if (item.NgayBan.isBefore(ngayKetThuc) &&
          item.NgayBan.isAfter(ngayBatDau)) {
        tong += item.TongTien;
      }
    }
    return tong;
  }

  // tính tong lợi nhuận theo thời gian
  double tinhTongLoiNhuan(DateTime ngayBatDau, DateTime ngayKetThuc) {
    double tong = 0;
    for (var item in LHD) {
      if (item.NgayBan.isBefore(ngayKetThuc) &&
          item.NgayBan.isAfter(ngayBatDau)) {
        tong += item.LoiNhuanThucTe(item.DT.GiaN);
      }
    }
    return tong;
  }

  // thong kê điện thoại bán chạy
  void thongKeDienThoaiBanChay() {
    print("\nHiển thị danh sách điện thoại bán chạy:");
    List<DienThoai> dt = List.from(
      LDT..sort((a, b) => b.SLDB.compareTo(a.SLDB)),
    );
    for (var item in dt) {
      print(item.HienThi());
    }
  }

  void thongKeTonKho() {
    print("\nThống kê tồn kho");
    List<DienThoai> dt = List.from(
      LDT..sort((a, b) => b.SLTK.compareTo(a.SLTK)),
    );
    for (var item in dt) {
      print(item.HienThi());
    }
  }
}
