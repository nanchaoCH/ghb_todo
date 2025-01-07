// 😄 7.Asynchronous Programming
//
// Dart มีฟีเจอร์ async และ await สำหรับการทำงานแบบ Asynchronous
//==============================================================================================

Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2)); // จำลองการรอ
  return 'Data fetched!';
}

void main() async {
  print('Fetching data...');
  String data = await fetchData();
  print(data);
}
