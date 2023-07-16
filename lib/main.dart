import 'package:flutter/material.dart';
import 'package:assignment_2/home_page.dart';
import 'package:assignment_2/Expense_screen.dart';
import 'package:assignment_2/insert_popup.dart';
import 'package:assignment_2/necessary_classes.dart';

void main() {
  runApp(MaterialApp(
    title: 'Budget Tracker',
    initialRoute: '/home',
    routes: {
      '/home' : (context) => Home(),
      '/expense' : (context) =>Expense_screen(),
      '/insert' : (context) => popPup(),
    },
  ));
}
