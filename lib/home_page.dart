import 'dart:io';
import 'package:flutter/material.dart';
import 'package:assignment_2/necessary_classes.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Expense> expenses = [Expense(category: 'Groceries', amount: -500),Expense(category: 'Salary', amount: 50000)];
  int amount = 0;

  @override
  void initState() {
    super.initState();
    calculateTotalAmount();
  }

  void calculateTotalAmount() {
    for (var i in expenses) {
      amount += i.amount;
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
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
      body:Container(
        alignment: Alignment.center,
        color: Colors.purple[200],
        child: Expanded(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Icon(
                    Icons.person_2_rounded,
                    size: 220,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 50
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Back!',
                    style: TextStyle(
                        fontSize: 50
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
                      ),
                      SizedBox(width:150 ,),
                      Container(
                        child: Text('$amount',
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        tooltip: 'Expenses',
        onPressed: ()=>setState(() {
          Navigator.pushNamed(context, '/expense');
        }),
        child: Icon(
          Icons.add,
          color: Colors.purple[800],
        ),
      ),
    );
  }
}