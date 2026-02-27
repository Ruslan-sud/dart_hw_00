import 'person.dart';
import 'subjects.dart';

class Student extends Person {
  Student(super.fullName, super.age, super.isMarried, this.marks);
  Map<Subject, double> marks;

  void showMarks() {
    print('Student: $fullName');
    for (var entry in marks.entries) {
      print('${entry.key.name}: ${entry.value}');
    }
  }

  double calculateAverage() {
    double sum = 0;

    for (var value in marks.values) {
      sum += value;
    }

    return sum / marks.length;
  }

  @override
  void introduce() {
    super.introduce();
    print('Average mark: ${calculateAverage()}');
  }
}
