// 😄 5.Functions (ฟังก์ชัน)
//==============================================================================================

// ฟังก์ชันแบบปกติ
int add(int a, int b) {
  return a + b;
}

// ฟังก์ชันแบบย่อ (Arrow Function)
int multiply(int a, int b) => a * b;

void main() {
  print('Sum: ${add(5, 3)}');
  print('Product: ${multiply(4, 2)}');
}
