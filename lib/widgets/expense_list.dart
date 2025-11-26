import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenselist,
    required this.onDeleteExpense,
  });

  final List<Expense> expenselist;
  final void Function(Expense expense) onDeleteExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenselist.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenselist[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin?.horizontal ?? 16,
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          child: const Icon(Icons.delete, color: Colors.white, size: 40),
        ),
        onDismissed: (direction) {
          onDeleteExpense(expenselist[index]);
        },
        child: ExpenseItem(expenselist[index]),
      ),
    );
  }
}
