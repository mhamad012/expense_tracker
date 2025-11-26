import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expense_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class ExpensesApp extends StatefulWidget {
  const ExpensesApp({super.key});

  @override
  State<ExpensesApp> createState() => _ExpensesAppState();
}

class _ExpensesAppState extends State<ExpensesApp> {
  final List<Expense> _registeredExpensesList = [
    Expense(
      title: "Burger",
      amount: 2,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "fajita",
      amount: 5,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Canada",
      amount: 1,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: "pizza",
      amount: 2,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpensesList.add(expense);
    });
    Navigator.pop(context);
  }

  void _deleteExpense(Expense expense) {
    int index = _registeredExpensesList.indexOf(expense);
    setState(() {
      _registeredExpensesList.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Expense Deleted"),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpensesList.insert(index, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Text(
          'No expenses found! Add some to see them here.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
    );

    if (_registeredExpensesList.isNotEmpty) {
      mainContent = ExpenseList(
        expenselist: _registeredExpensesList,
        onDeleteExpense: _deleteExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(children: [Expanded(child: mainContent)]),
    );
  }
}
