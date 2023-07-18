import 'package:flutter/material.dart';
import 'package:assignment_2/necessary_classes.dart';


class Expense_Screen extends StatefulWidget {
  const Expense_Screen({super.key});

  @override
  State<Expense_Screen> createState() => _Expense_ScreenState();
}

class _Expense_ScreenState extends State<Expense_Screen> {
  List<Expense> expenses = [];
  int amount = 0;
  Expense new_entry = Expense(category: ' ', amount: 00);
  late TextEditingController categoryController ;
  late TextEditingController amountController ;

  @override
  void initState() {
    categoryController = TextEditingController();
    amountController = TextEditingController();
    super.initState();
    calculateTotalAmount();
  }

  void calculateTotalAmount() {
    amount =0;
    for (var i in expenses) {
      amount += i.amount;
    }
  }

  void delete(Expense expense) {
    setState(() {
      expenses.remove(expense);
      calculateTotalAmount();
    });
  }

  @override
  void dispose(){
    categoryController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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

      actions: [
        FloatingActionButton(
          tooltip: 'user details',
          onPressed: ()=> setState(() {
            Navigator.pushNamed(context, '/userpage');
          }),
          backgroundColor: Colors.grey[900],
          child: Icon(
            Icons.person,
            color: Colors.red[800],
          ),
        )
      ],
    ),
      body: Container(
        color: Colors.grey[850],
        child: Column(
            children: [
        Container(
        margin: EdgeInsets.only(bottom: 100),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Container(
        margin : EdgeInsets.fromLTRB(30,0,0,0),
        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Text(
          'Expenses',
          style: TextStyle(
            fontSize: 60,
            color: Colors.red[800],
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
        Container(
          width: 300,
          margin: EdgeInsets.fromLTRB(15,50,10,10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.pink[50],
          ),
          child: Row(
            children: [
              Text('Total :',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
              const SizedBox(width: 20),
              Text(
                '$amount',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height:200 ,
          child: SingleChildScrollView(
           child: ListView.builder(
            shrinkWrap: true, // Allow the ListView to take only the space required by its children
            itemCount: expenses.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => expense(expenses[index],delete),
           ),
          ),
        ),
      ]
    ),
      ),
      ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[900],
        tooltip: 'insert',
        onPressed: ()async {
          final new_expense = await openDialog();
          if(new_expense == null) return;
          setState(() {
            new_entry = new_expense;
            expenses.add(new_entry);
            calculateTotalAmount();
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.red[800],
        ),
      ),

    );
  }

  Future<Expense?> openDialog() => showDialog<Expense>(
      context: context,
      builder:(context) => AlertDialog(
        title: Text('New Entry'),
        content:
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[850],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                style: TextStyle(color: Colors.white,),
                controller: categoryController,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'Enter Category',
                  hintStyle: TextStyle(color: Colors.amber),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height:20),
              TextField(
                style: TextStyle(color: Colors.white,),
                controller: amountController,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'Enter Amount',
                  hintStyle: TextStyle(color: Colors.amber),
                   ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        actions: [
          FloatingActionButton(
            backgroundColor: Colors.grey[900],
            onPressed: submit,
            child: Icon(Icons.check_circle_outline),
          )
        ],
      )
  );

  void submit(){
    Navigator.of(context).pop(Expense(category: categoryController.text, amount: int.parse(amountController.text)));
  }


}


Widget expense(Expense new_expense,Function(Expense) delete){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 300,
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.pink[50],
        ),
        child: Row(
          children: [
            Container(
              width: 150,
              child: Text('${new_expense.category} ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
            ),
            SizedBox(width: 50),
            Container(
              child: Text('${new_expense.amount} ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(0,0,0,30),
        padding: EdgeInsets.only(top:35),
        child: FloatingActionButton(
          tooltip: 'Delete',
          onPressed: (){
            delete(new_expense);
            },
          backgroundColor: Colors.grey[900],
          child: Icon(
            Icons.delete_outline,
            color: Colors.grey[850],
          ),
        ),
      )
    ],
  );
}

/*void delete(Expense new_expense,List<Expense> expenses){
  expenses.remove(new_expense);
}*/