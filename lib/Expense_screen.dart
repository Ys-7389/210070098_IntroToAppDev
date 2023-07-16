import 'dart:io';
import 'package:flutter/material.dart';
import 'package:assignment_2/necessary_classes.dart';
import 'package:assignment_2/insert_popup.dart';


class Expense_screen extends StatefulWidget {
  const Expense_screen({super.key});

  @override
  State<Expense_screen> createState() => _Expense_screenState();
}

class _Expense_screenState extends State<Expense_screen> {
  List<Expense> expenses = [Expense(category: 'Groceries', amount: -500),Expense(category: 'Salary', amount: 50000)];
  int amount =0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          'Budget Tracker',
          style:TextStyle(
            fontSize: 35,
            color: Colors.purple[800],
            fontWeight: FontWeight.bold,
          ) ,
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[200],
        elevation: 0,
      ),
      body:  Container(
        color: Colors.purple[200],
        child: Expanded(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 100),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Text(
                          'Expenses',
                          style: TextStyle(
                            fontSize: 80,
                            color: Colors.purple[800],
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      Container(
                        width: 650,
                        margin: EdgeInsets.fromLTRB(15, 50, 15, 10),
                        padding: EdgeInsets.fromLTRB(50, 10, 10, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.pink[50],
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: Text('Total :',
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),),
                            )
                          ],
                        ),
                      ),
                      Column(children:expenses.map((e) => expense(e)).toList() ),
                    ],
                  )
                ),
              ],
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        tooltip: 'insert',
        onPressed: ()=>setState(() {
          Navigator.pushNamed(context, '/insert');
        }),
        child: Icon(
          Icons.add,
          color: Colors.purple[800],
        ),
      ),
    );
  }
}

Widget expense (Expense new_expense) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 600,
          margin: EdgeInsets.fromLTRB(20, 50, 20, 10),
          padding: EdgeInsets.fromLTRB(50, 10, 10, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.pink[50],
          ),
          child: Row(
            children: [
              Container(
                width: 200,
                child: Text('${new_expense.category} ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
              SizedBox(width: 100),
              Container(
                child: Text('${new_expense.amount} ',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
      ),
        Container(
          margin: EdgeInsets.only(top:10),
          padding: EdgeInsets.only(top:35),
          child: FloatingActionButton(
            tooltip: 'Delete',
              onPressed: (){},
            backgroundColor: Colors.grey[900],
            child: Icon(
                Icons.delete_outline,
              color: Colors.purple[200],
            ),
          ),
        )
      ],
    );
}
