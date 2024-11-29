class NhanVien {
  String MaNV;
  String HoTen;
  num LuongCoBan;

  NhanVien(this.MaNV, this.HoTen, this.LuongCoBan);

  // Setter and getter for tenSach
  String get MaNVGetter => MaNV;
  set MaNVSetter(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Mã nhân viên không được để trống');
    }
    MaNV = value;
  }

  // Setter and getter for maSach
  String get HoTenGetter => HoTen;
  set HoTenSetter(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Họ tên không được rỗng');
    }
    HoTen = value;
  }

  // Setter and getter for tacGia
  num get LuongCoBanGetter => LuongCoBan;
  set LuongCoBanSetter(num value) {
    if (value < 0) {
      throw ArgumentError('Lươn cơ bản phải lơn hơn 0');
    }
    LuongCoBan = value;
  }

  // tinh lương
  num tinhLuong() {
    return LuongCoBan;
  }

  // Xuất thông tin nhan vien
  void HienThiTHongTin() {
    print(
      'Mã nhân viên: $MaNV - Họ tên: $HoTen - Lương cơ bản: ${tinhLuong()}',
    );
  }
}

class nhanVienBanHang extends NhanVien {
  num DoanhSo;
  num TyLeHoaHong;

  nhanVienBanHang(
    String Manv,
    String Hoten,
    num luongCoBan,
    this.DoanhSo,
    this.TyLeHoaHong,
  ) : super(Manv, Hoten, luongCoBan);
  // Tính lương bao gồm hoa hồng
  @override
  num tinhLuong() {
    num luongCoBan = super.tinhLuong();
    num hoaHong = DoanhSo * TyLeHoaHong;
    return luongCoBan + hoaHong;
  }

  // Xuất thông tin nhân viên bán hàng
  @override
  void HienThiTHongTin() {
    super.HienThiTHongTin();
    print('Doanh số: $DoanhSo - Tỷ lệ hoa hồng: $TyLeHoaHong');
  }
}

void main() {
  // Khởi tạo một nhân viên bán hàng
  nhanVienBanHang nhanVien = nhanVienBanHang(
    'NV001',
    'Nguyen Van A',
    5000000,
    10000000,
    0.1,
  );

  // Xuất thông tin nhân viên
  nhanVien.HienThiTHongTin();

  // Tính lương
  print('Lương: ${nhanVien.tinhLuong()}');
}
