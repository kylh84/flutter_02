class Student {
  // Properties
  late int id;
  late String name;
  late num mark1;
  late num mark2;
  late num mark3;

  // Student(int id, String name, num mark1, num mark2, num mark3) {
  //   this.id = id;
  //   this.name = name;
  //   this.mark1 = mark1;
  //   this.mark2 = mark2;
  //   this.mark3 = mark3;
  // }

  Student() {}

  Student.initial(this.id, this.name, this.mark1, this.mark2, this.mark3);

  num total() {
    return mark1 + mark2 + mark3;
  }

  num average() {
    return total() / 3;
  }
}
