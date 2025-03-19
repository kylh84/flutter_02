import 'dart:io';

void main() {
  int age;

  print('Enter age:');
  age = int.parse(stdin.readLineSync()!);
  print('Age: $age');

  // try {
  //   var result = divide(10, 3);
  //   print('Result: $result');
  // } catch (e) {
  //   print('Error: $e');
  // }
  //
  // try {
  //   int number = int.parse("abc");
  //   print('Number: $number');
  // } catch (e) {
  //   print('Error: $e');
  // }
}

num divide(int num1, int num2) {
  if (num2 == 0) {
    throw Exception('Division by zero!');
  }

  return num1 / num2;
}
