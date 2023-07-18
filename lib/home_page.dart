import 'dart:io';
import 'package:flutter/material.dart';
import 'package:assignment_2/necessary_classes.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Expense> expenses = [];
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
            color: Colors.red[800],
            fontWeight: FontWeight.bold,
          ) ,
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0,
      ),
      body:Container(
        alignment: Alignment.center,
        color: Colors.grey[850],
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
                  color: Colors.red[800],
                    fontSize: 50
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                'Back!',
                style: TextStyle(
                    color: Colors.red[800],
                    fontSize: 50
                ),
              ),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.fromLTRB(25, 50, 15, 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.pink[50],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Text('Total :',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                  SizedBox(width:50 ,),
                  Container(
                    child: Text('$amount',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[900],
        tooltip: 'Expenses',
        onPressed: ()=>setState(() {
          Navigator.pushNamed(context, '/expense');
        }),
        child: Icon(
          Icons.add,
          color: Colors.red[800],
        ),
      ),
    );
  }
}