import 'package:flutter/material.dart';
import 'package:assignment_2/home_page.dart';
import 'package:assignment_2/ExpenseScreen.dart';


void main() {
  runApp(MaterialApp(
    title: 'Budget Tracker',
    initialRoute: '/home',
    routes: {
      '/home' : (context) => Home(),
      '/expense' : (context) =>Expense_Screen(),
    },
  )
  );
}
