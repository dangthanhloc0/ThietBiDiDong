class Sach {
  String maSach;
  String tenSach;
  String tacGia;
  String trangThaiMuon;

  Sach(this.maSach, this.tenSach, this.tacGia, this.trangThaiMuon);

  // Setter and getter for tenSach
  String get tenSachGetter => tenSach;
  set tenSachSetter(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Tên sách không được để trống');
    }
    tenSach = value;
  }

  // Setter and getter for maSach
  String get maSachGetter => maSach;
  set maSachSetter(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Mã sách không được rỗng');
    }
    maSach = value;
  }

  // Setter and getter for tacGia
  String get tacGiaGetter => tacGia;
  set tacGiaSetter(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Tác giả không được rỗng');
    }
    tacGia = value;
  }

  // Setter and getter for trangThaiMuon
  String get trangThaiMuonGetter => trangThaiMuon;
  set trangThaiMuonSetter(String value) {
    trangThaiMuon = value;
  }

  // Xuất thông tin sách
  void xuatThongTinSach() {
    print(
      'Mã sách: $maSach - Tên sách: $tenSach - Tác giả: $tacGia - Trạng thái: $trangThaiMuon',
    );
  }
}

class DocGia {
  String hoTen;
  String maDG;
  Set<Sach> danhSachDangMuon;

  DocGia(this.hoTen, this.maDG) : danhSachDangMuon = <Sach>{};

  // Setter and getter for hoTen
  String get hoTenGetter => hoTen;
  set hoTenSetter(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Tên không được để trống');
    }
    hoTen = value;
  }

  // Setter and getter for maDG
  String get maDGGetter => maDG;
  set maDGSetter(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Mã độc giả không được rỗng');
    }
    maDG = value;
  }

  // Kiểm tra sách đã có người mượn chưa
  bool kiemTraSachDaCoNgDungMuon(Sach s) {
    return s.trangThaiMuon == "Đã mượn";
  }

  // Thêm sách vào danh sách mượn
  String muonSach(Sach s) {
    if (!kiemTraSachDaCoNgDungMuon(s)) {
      s.trangThaiMuonSetter = "Đã mượn";
      danhSachDangMuon.add(s);
      return "Thêm sách thành công";
    } else {
      return "Sách đã có người mượn";
    }
  }

  // Cập nhật trạng thái
  void capNhatTrangThaiMuon(Sach s, String trangThai) {
    s.trangThaiMuon = trangThai;
  }

  // Trả sách
  String traSach(Sach s) {
    if (s.trangThaiMuon == "Đã mượn") {
      s.trangThaiMuon = "Chưa mượn";
      danhSachDangMuon.remove(s);
      return "Trả sách thành công";
    } else {
      return "Sách chưa được mượn";
    }
  }

  // hiện thị danh sách sách đã mượn
  void HienThiSachDaMuon() {
    print("Danh sách sách đã mượn");
    for (Sach s in danhSachDangMuon) {
      s.xuatThongTinSach();
    }
  }
}

// Lớp thư viện
class ThuVien {
  List<DocGia> danhSachDocGia;
  List<Sach> danhSachSach;

  ThuVien(this.danhSachDocGia, this.danhSachSach);

  // Getter sách
  Sach getSach(int index) {
    return danhSachSach[index];
  }

  // Thêm sách hoặc độc giả
  void add<T>(T obj) {
    if (obj is DocGia) {
      danhSachDocGia.add(obj);
    } else if (obj is Sach) {
      danhSachSach.add(obj);
    }
  }

  // Hiển thị danh sách sách
  void hienThiDanhSachSach() {
    print("Danh sách sách của thu viện là");
    for (Sach item in danhSachSach) {
      item.xuatThongTinSach();
    }
  }
}

void main() {
  try {
    Sach sach1 = Sach(
      '001',
      'Tiền lương không phải là tất cả',
      'abc',
      'Chưa mượn',
    );
    Sach sach2 = Sach('002', 'Nhưng tất cả cần tiền lương', 'CDF', 'Chưa Mượn');
    Sach sach3 = Sach(
      '003',
      'Kiểm tiền rất vui nhưng rất mệt',
      '1234',
      'Chưa Mượn',
    );
    DocGia Dg1 = DocGia("Loc", "1");
    DocGia Dg2 = DocGia("Thui", "2");
    List<DocGia> danhSachDocGia = <DocGia>[Dg1, Dg2];
    List<Sach> danhSachSach = <Sach>[sach1, sach2, sach3];
    ThuVien TV = ThuVien(danhSachDocGia, danhSachSach);
    // độc giả mươn sách
    Dg1.muonSach(sach1);
    Dg1.muonSach(sach2);
    Dg1.HienThiSachDaMuon();
    // trả sách
    Dg1.traSach(sach1);
    // danh sách sau khi trả sách 1
    Dg1.HienThiSachDaMuon();
    // kiểm tra quản lí thư viện
    TV.hienThiDanhSachSach();
  } catch (e) {
    print(e.toString());
  }
}
