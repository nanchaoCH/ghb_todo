// 😄 6.Classes and Objects
//
// Dart รองรับการเขียนโปรแกรมเชิงวัตถุ (OOP)
//==============================================================================================

class Person {
  String name;
  int age;

  // Constructor
  Person(this.name, this.age);

  void introduce() {
    print('Hello, my name is $name and I am $age years old.');
  }
}

void main() {
  Person p = Person('Alice', 30);
  p.introduce();
}
