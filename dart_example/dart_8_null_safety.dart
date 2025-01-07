// 😄 8.Null Safety
//
// Dart รองรับ Null Safety เพื่อลดปัญหา Null Pointer Exception
//==============================================================================================

void main() {
  String? name; // กำหนดว่า name สามารถเป็น null ได้
  print(name?.length); // ใช้ ?. เพื่อป้องกัน null error
}
