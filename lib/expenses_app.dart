import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpensesApp extends StatefulWidget {
  const ExpensesApp({super.key});

  @override
  State<ExpensesApp> createState() => _ExpensesAppState();
}

class _ExpensesAppState extends State<ExpensesApp> {
  final List<Expense> _registeredExpensesList = [
    Expense(title: "Burger", amount: 2, date: DateTime.now(), Category.food),
    Expense(title: "fajita", amount: 5, date: DateTime.now(), Category.food),
    Expense(title: "Canada", amount: 1, date: DateTime.now(), Category.travel),
    Expense(title: "pizza", amount: 2, date: DateTime.now(), Category.food),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expenses")),
      //body: ,
    );
  }
}
