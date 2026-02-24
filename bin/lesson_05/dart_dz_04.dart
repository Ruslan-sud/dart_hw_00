import 'librari.dart';
import 'book.dart';

void main() {
  Book book1 = Book("Harry Potter", "J.K. Rowling");
  Book book2 = Book.withRating("Sherlock Holmes", "Arthur Conan Doyle", 8.7);
  Book book3 = Book("The Great Gatsby", "F. Scott Fitzgerald");
  book3.rating = 9.2;

  book1.displayInfo();
  book2.displayInfo();
  book3.displayInfo();

  Library cityLib = Library("City Library");

  cityLib.addBook(book1);
  cityLib.addBook(book2);
  cityLib.addBook(book3);

  cityLib.showBooks();

  print("Total books in library: ${cityLib.totalBooks}");
}
