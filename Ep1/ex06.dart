// 1 số nguyên >=1 nhập từ bàn phím thành nhị phân
import 'dart:io';
void main () {
  int n = 0; 
  do {
    print("Nhập số N (N>=1) :");
    String ? temp;
    temp = stdin.readLineSync();
    if (temp != null) {
      n = int.tryParse(temp) ?? 0;
    }
    if (temp == 0) {
      print('Vui lòng nhập lại,N >=1');
    } 
  } while(n<1);

  var lists = [];  
  // chuyeenr dooi so nguyen thanh nhi phan
  int temp =n;
  while(true) {
      lists.add(n%2); 
      n = n~/2;
      if(n==0) break;
    
  }
  // in ra man hinh 
  print("${temp} la :");
  for(var item in lists.reversed){
    stdout.write(item);  
  }

}