// tong cac uoc cua 1 so nguyen
import 'dart:io';
void main (){
  int n = 0; 
  int tong =0;
  do {
    print("Nhập số N (N>0) :");
    String ? temp;
    temp = stdin.readLineSync();
    if (temp != null) {
      n = int.tryParse(temp) ?? 0;
    }
    if (temp == 0) {
      print('Vui lòng nhập lại,N >0');
    } 
  } while(n<1);

  for(int i =2 ; i < n-1 ; i++){  
    if(n%i==0) {
      tong += i;
    }
  }

  print("tong cac uoc cua $n la ${tong+1}");  
    
}