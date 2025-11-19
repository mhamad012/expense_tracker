import 'package:uuid/uuid.dart';

enum Category { food, work, leisure, travel }

class Expense {
  final String id = Uuid().v4();
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense(
    this.category, {
    required this.title,
    required this.amount,
    required this.date,
  });
}
