import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/model/expense.dart' as expense_model;
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import '../model/expense.dart';

// import 'package:expense_tracker/expenses.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpenseTrackerState();
  }
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Grocery', 
      amount: 100.0, 
      date: DateTime.now(), 
      category:  expense_model.Category.food,
    ),
    Expense(
      title: 'Cinema', 
      amount: 100.0, 
      date: DateTime.now(), 
      category: expense_model.Category.transportation,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context, 
      builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
