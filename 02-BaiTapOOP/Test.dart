import 'CuaHang.dart';
import 'DienThoai.dart';
import 'HoaDon.dart';
import 'KhachHang.dart';

void main() {
  try {
    // tạo điện thoại
    DienThoai dt1 = new DienThoai(
      "001",
      "Samsum01",
      "SamSum",
      2000,
      3000,
      123456,
      true,
      0,
    );
    DienThoai dt2 = new DienThoai(
      "002",
      "IPhoneX",
      "Iphone",
      30000,
      444000,
      1234567,
      true,
      0,
    );
    // tạo khách hàng
    Khachhang kh1 = new Khachhang("Loc", "0379001285");
    Khachhang kh2 = new Khachhang("Thao", "0966169674");
    // tạo hóa đơn
    Hoadon hd1 = new Hoadon("002", DateTime(2024, 6, 2), dt1, 10, 10000, kh1);
    // kiểm tra ràng buộc
    // dt1.SLTK = 0;
    // hd1.SoLuong = 10000;
    // tinh toán tiền và lợi nhuận
    Hoadon hd2 = new Hoadon("003", DateTime(2024, 6, 2), dt2, 2, 100000, kh1);
    print("Tong tien hd2 : ${hd2.TongTien}");
    print("Tính lợi nhuận ${hd2.LoiNhuanThucTe(hd2.DT.GiaN)}");
    // tạo cửa hàng
    print(" \n\nCửa Hàng \n\n");
    Cuahang ch = new Cuahang("Cửa Hàng 1", "Hồ Chí Minh");
    ch.ThemDienThoaiMoi(dt1);
    ch.ThemDienThoaiMoi(dt2);
    ch.addHoaDon(hd1);
    ch.addHoaDon(hd2);
    // hiện thị danh sách điện thoại
    ch.hienThiDanhSachDienThoai();
    // hiện thị danh sách hóa đơn
    ch.HienTthiHd();
    // hiện thị danh sách thống kê doanh thu
    print(
      ("Thống kê doanh thu thời thời gian: ${ch.tinhTongDoanhThu(DateTime(2024, 1, 1), DateTime.now())}"),
    );
    // hiện thị danh sách thống kê lợi nhuận
    print(
      ("Thống kê lợi nhuận thời thời gian: ${ch.tinhTongLoiNhuan(DateTime(2024, 1, 1), DateTime.now())}"),
    );
    // hiện thị danh sách thống kê điện thoại bán chạy
    ch.thongKeDienThoaiBanChay();
    // thống kê tồn kho
    ch.thongKeTonKho();

    // thóng kê báo cáo
  } catch (e) {
    print(e.toString());
  } finally {
    print("Chương trình kết thúc");
  }
}
