import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { 
  food,
  transportation,
  shopping,
  rent,
}

const CategoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.transportation: Icons.flight_takeoff,
  Category.shopping: Icons.shopping_cart,
  Category.rent: Icons.home,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category; // Updated to use Category enum

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
          .where((expense) => expense.category == category)
          .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum =0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
    // return expenses.fold(0.0, (sum, expense) => sum + expense.amount);
  }
}