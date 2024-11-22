import 'dart:io';
import 'dart:math';

void main() {
  num a = 0, b = 0, c = 0;
  // nhập input a
  do {
    stdout.write('Nhập hệ số a(a != 0):');
    String? input = stdin.readLineSync();
    if (input != null) {
      a = double.tryParse(input) ?? 0;
    }
    if (a == 0) {
      print('Hệ số a không thể bằng 0');
    }
  } while (a == 0);

  // nhập input b
  stdout.write('Nhập hệ số b:');
  String? inputb = stdin.readLineSync();
  if (inputb != null) {
    b = double.tryParse(inputb) ?? 0;
  }
  // nhập input b
  stdout.write('Nhập hệ số c:');
  String? inputc = stdin.readLineSync();
  if (inputc != null) {
    c = double.tryParse(inputc) ?? 0;
  }

  // hiển thị phương trình 
  print("Phương trình : ${a}x^2 + ${b}x + ${c} =0" );

  // tính denta
  num denta = pow(b, 2) - 4 * a * c;  
  // tính nghiệm  
  if(denta < 0) {
    print('Phương trình vô nghiệm');  
  } else if (denta == 0) {  
    num x = -b / (2 * a); 
    x = num.parse(x.toStringAsFixed(2));
    print("Phương trình có 1 ngiệm kép $x");
  } else {
    num x1 = (-b + sqrt(denta)) / (2 * a);
    x1 = num.parse(x1.toStringAsFixed(2));  
    num x2 = (-b - sqrt(denta)) / (2 * a); 
    x2 = num.parse(x2.toStringAsFixed(2));  
    print("Phương trình có 2 nghiệm $x1 và $x2"); 
  }


}
