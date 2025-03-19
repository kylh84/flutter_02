import 'dart:io';

void main() {
  int age = 0;
  bool isValid = false;

  do {
    print('Enter age:');

    try {
      age = int.parse(stdin.readLineSync()!);
      if (age < 0) {
        throw Exception('Age cannot be negative!');
      }

      isValid = true;
    } catch (e) {
      // print('Invalid input. Please enter a valid age.');
      print(e);
    }
  } while (!isValid);

  try {
    var result = divide(10, 0);
    print('Result: $result');
  } catch (e) {
    print('Error: $e');
  }
}

num divide(int num1, int num2) {
  if (num2 == 0) {
    throw Exception('Division by zero!');
  }

  return num1 / num2;
}
