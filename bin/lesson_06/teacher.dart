import 'person.dart';

class Teacher extends Person {
  int experience;
  static double _baseSalary = 50000;
  Teacher(super.fullName, super.age, super.isMarried, this.experience);

  double calculateSalary() {
    double salary = _baseSalary;

    if (experience > 3) {
      for (int year = 4; year <= experience; year++) {
        salary = salary + salary * 0.05;
      }
    }

    if (isMarried) {
      salary += 5000;
    }

    return salary;
  }

  @override
  void introduce() {
    super.introduce();
    print('Experience: $experience years.');
    print('Salary: ${calculateSalary()}');
  }
}
