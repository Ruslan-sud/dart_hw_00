import 'subjects.dart';
import 'student.dart';
import 'teacher.dart';

void main() {
  Teacher teacher = Teacher('Alice Johnson', 35, true, 10);
  teacher.introduce();
  teacher.calculateSalary();

  Student student1 = Student('Bob Smith', 20, false, {
    Subject.math: 85,
    Subject.physics: 92,
    Subject.history: 78,
    Subject.english: 88,
  });

  Student student2 = Student('Charlie Brown', 22, false, {
    Subject.math: 75,
    Subject.physics: 80,
    Subject.english: 88,
    Subject.history: 82,
  }); 

  Student student3 = Student('Diana Prince', 19, true, {
    Subject.math: 90,
    Subject.physics: 95,
    Subject.english: 93,
    Subject.history: 89,
  });

  print('----------------');

  student1.introduce();
  student1.showMarks();
  student1.calculateAverage();

  print('----------------');

  student2.introduce();
  student2.showMarks();
  student2.calculateAverage();

  print('----------------');

  student3.introduce();
  student3.showMarks();
  student3.calculateAverage();
}