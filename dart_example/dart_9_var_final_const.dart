// 😄 8.Var, Final and Const
//
// ใน Dart ตัวแปร var, const และ final ใช้ในการกำหนดตัวแปร โดยมีการทำงานและข้อจำกัดที่แตกต่างกัน
//==============================================================================================

void main() {
  // 🎯 Var
  // ใช้สำหรับตัวแปรที่ค่า สามารถเปลี่ยนแปลงได้ (mutable)
  // Dart จะกำหนดชนิดข้อมูลให้โดยอัตโนมัติ (type inference) เมื่อกำหนดค่าให้กับตัวแปร
  // ข้อควรระวัง: หากกำหนดค่าให้ var แล้ว Dart จะไม่อนุญาตให้เปลี่ยนชนิดข้อมูล

  var name = 'John'; // Dart จะเข้าใจว่า name เป็น String
  print(name);

  name = 'Alice'; // สามารถเปลี่ยนค่าได้
  print(name);
  //=======================================================================

  // 🎯 Final
  // ใช้สำหรับตัวแปรที่ค่า ไม่สามารถเปลี่ยนแปลงได้ (immutable) หลังจากกำหนดค่าให้ครั้งแรก
  // กำหนดค่าได้เพียงครั้งเดียว แต่สามารถกำหนดค่าใน runtime (ตอนที่โปรแกรมรัน)
  // ใช้ในกรณี: ตัวแปรที่รู้ค่าแน่นอนใน runtime แต่จะไม่เปลี่ยนแปลง เช่น ข้อมูลผู้ใช้งาน, เวลาเริ่มโปรแกรม

  final city = 'Bangkok';
  print(city);
  //=======================================================================

  // 🎯 Const
  // ใช้สำหรับตัวแปรที่ค่า ไม่สามารถเปลี่ยนแปลงได้ (immutable) เช่นเดียวกับ final
  // แต่ค่าของตัวแปร const ต้องถูกกำหนดตั้งแต่ compile-time (ก่อนโปรแกรมรัน)

  const pi = 3.14159;
  print(pi);
  // pi = 3.14; // Error: ค่าไม่สามารถเปลี่ยนได้
  //=======================================================================
}



// 😄 สรุปการเลือกใช้งาน 🚀
// ใช้ var     เมื่อค่าของตัวแปรจะเปลี่ยนแปลง
// ใช้ final   เมื่อค่าของตัวแปรจะไม่เปลี่ยนแปลง แต่ไม่รู้ค่าล่วงหน้า
// ใช้ const   เมื่อค่าของตัวแปรจะไม่เปลี่ยนแปลงและรู้ค่าล่วงหน้าตั้งแต่ compile-time
//==============================================================================================