import 'person.dart';

class Employee extends Person {
  int employeeId;
  String department;

  Employee(String name, int age, this.employeeId, this.department)
      : super(name, age);

  @override
  void displayInfo() {
    super.displayInfo();
    print(employeeId);
    print(department);
  }

  void input() {}

  // void displayInfo() {
  //   super.displayInfo();
  //   print(employeeId);
  //   print(department);
  // }
}
