class sinhvien {
  // khai bao
  String HoTen, Mssv;
  int tuoi;
  num diemTrungBinh;
  sinhvien(this.HoTen, this.Mssv, this.tuoi, this.diemTrungBinh);

  // setter and getter
  // Ten
  String get _hoten => HoTen;
  set _hoten(String value) {
    if (value.isEmpty) {
      throw ArgumentError('ten khong duoc de trong');
    }
    HoTen = value;
  }

  // Tuoi
  int get _tuoi => this.tuoi;
  set _tuoi(int value) {
    if (value <= 0) {
      throw ArgumentError('tuoi khong duoc nho <= 0');
    }
    this.tuoi = value;
  }

  // mssv
  String get _mssv => Mssv;
  set _mssv(String value) {
    if (value.isEmpty) {
      throw ArgumentError('ten khong duoc de trong');
    }
    Mssv = _mssv;
  }

  // diem trung binh
  num get _diemTrungBinh => diemTrungBinh;
  set __diemTrungBinh(num value) {
    if (value < 0 || value > 10) {
      throw ArgumentError('diem trung binh khong duoc nho <= 0 || diem > 10');
    }
    diemTrungBinh = value;
  }

  // xuat thong tin
  void xuatThongTinSinhVien() {
    print(
      'Ho ten: $HoTen - Mssv: $Mssv - Tuoi: $tuoi - diem trung binh : $diemTrungBinh',
    );
  }

  // xep loai
  String xepLoai() {
    String xepLoai = "";
    if (diemTrungBinh < 0 || diemTrungBinh > 10) {
      xepLoai = "khong hop le";
    }
    if (diemTrungBinh < 5) {
      xepLoai = 'Yeu';
    } else if (diemTrungBinh <= 6.5) {
      xepLoai = 'Trung binh';
    } else if (diemTrungBinh <= 8) {
      xepLoai = 'Kha';
    } else {
      xepLoai = 'Gioi';
    }
    return xepLoai;
  }
}

// Lop lop hoc
class LopHoc {
  String tenLop;
  List<sinhvien> DanhSachSinhVien = [];
  LopHoc({required this.tenLop});
  // getter va setter
  String get _GettertenLop => tenLop;
  set _SettertenLop(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Tên lớp không được để trống');
    }
    tenLop = value;
  }

  // thêm sinh viên
  void themSinhVien(sinhvien sinhVien) {
    DanhSachSinhVien.add(sinhVien);
  }

  // hien thi danh sach sinh vien
  void hienThiDanhSachSinhVien() {
    for (var sinhVien in DanhSachSinhVien) {
      sinhVien.xuatThongTinSinhVien();
    }
  }
}


