import 'dart:io';

import 'student.dart';

void printInfo({required Student student}) {
  print('Id of student 1: ${student.id}');
  print('Name of student 1: ${student.name}');
  print("Mark1 of student 1: ${student.mark1}");
  print("Mark2 of student 1: ${student.mark2}");
  print("Mark3 of student 1: ${student.mark3}");
  print('Total marks of student 1: ${student.total()}');
  print('Average marks of student 1: ${student.average()}');
}

void inputInfo({required Student student}) {
  print('Enter id (Not duplicated):');
  student.id = int.parse(stdin.readLineSync()!);

  print('Enter name:');
  student.name = stdin.readLineSync()!;

  print('Enter mark1:');
  student.mark1 = double.parse(stdin.readLineSync()!);

  print('Enter mark2:');
  student.mark2 = double.parse(stdin.readLineSync()!);

  print('Enter mark3:');
  student.mark3 = double.parse(stdin.readLineSync()!);
}

void main() {
  List<Student> students = [];
  int choice;

  do {
    print('1. Add');
    print('2. Display');
    print('3. Search by name');
    print('4. Search by id');
    print('0. Exit');

    print("Your choice: ");
    choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        var student = Student();
        inputInfo(student: student);
        students.add(student);
        break;
      case 2:
        for (var student in students) {
          printInfo(student: student);
        }
        break;
    }
  } while (choice != 0);

  // var student1 = Student();
  // var student2 = Student();
  // var student3 = Student();

  // student1.name = 'John';
  // student1.mark1 = 80;
  // student1.mark2 = 60;
  // student1.mark3 = 70;
  // inputInfo(student: student1);
  // inputInfo(student: student2);
  // inputInfo(student: student3);

  // printInfo(student: student1);
  // printInfo(student: student2);
  // printInfo(student: student3);

  // print('Name of student 1: ${student1.name}');
  // print("Mark1 of student 1: ${student1.mark1}");
  // print("Mark2 of student 1: ${student1.mark2}");
  // print("Mark3 of student 1: ${student1.mark3}");
  // print('Total marks of student 1: ${student1.total()}');
  // print('Average marks of student 1: ${student1.average()}');
}
