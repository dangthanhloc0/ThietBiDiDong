import 'QuanLiSinhVien.dart                                                                                      ';

void main() {
  // tạo 1 sinh vien
  try {
    sinhvien SV1 = new sinhvien('Dang Thanh Loc', '2180608882', 21, -1);
    sinhvien SV2 = new sinhvien('Nguyen Van A Thao', '2180608882', 21, 0.5);
    // xuất sinh viên
    SV1.xuatThongTinSinhVien();
    // xếp loại
    print('Xep loai cua sinh vien la : ${SV1.xepLoai()}');

    // tạo 1 lớp học
    LopHoc LH1 = new LopHoc(tenLop: "21DTHE5");
    // thêm sinh viên
    LH1.themSinhVien(SV1);
    LH1.themSinhVien(SV2);
    // xuất danh sách sinh viên
    LH1.hienThiDanhSachSinhVien();
  } catch (e) {
    print("Lỗi" + e.toString());
  }
}
