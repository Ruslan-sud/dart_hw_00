class Book {
  String _title;
  String _author;
  double _rating;

  Book(this._title, this._author, [this._rating = 0]);

  Book.withRating(this._title, this._author, this._rating);

String get title => _title;
String get author => _author;

  set rating(double value) {
    if (value < 0 || value > 10) {
      print("Rating must be between 0 and 10.");
      return;
    }
    _rating = value;
  }
  void displayInfo() {
    print("Title: $_title");
    print("Author: $_author");
    print("Rating: $_rating");
  }
}
