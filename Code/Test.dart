void main (){

// kiểu dữ liệu num vừa là thực vừa là nguyên
num ? z;
z ??= 4+4.1;
print(z); 

// toan tu gan gia trị
String? a ;
// đồng dạng với
// if(a == null) a = "abc";
a ??= "abc";
print(a);
// kết quả
// toan tử chia lấy phần nguyên
int d =14;
int e = 3;  
int f = d~/e; // kết quả sẽ là 4 bởi vì nó chỉ lấy phần nguyên  
print(f);

// đang test code
  String name;
  name = "loc";
  final int age;
  age =20;
  const int height = 180;
  late String mota = "Khong co gì de mo ta ";
  print('mo ta $mota'); 


  // Dùng cascade 
  var list = [1,2]
  ..add(3)
  ..remove(1)
  ..add(5);
  print(list);

  // var tạo ra 1 record = (dữ liệu cách nhau bởi dấu ,); => tạo ra 1 record có đủ dạng, kiểu giữ kiệu khác nhau
  // var tạo ra 1 map = [dữ liệu cách nhau bởi dấu :]; => map là 1 collection giống với ditionnary giống như bên C# đều có 1 {key,value}
  // var tạo ra 1 list = [dữ liệu cách nhau bởi dấu ,]; => dữ liệu được trùng nhau trong 1 list
  // var tạo ra 1 set = {dữ liệu cách nhau bởi dấu ,};   => dữ liệu không được trùng nhau trong 1 set
}