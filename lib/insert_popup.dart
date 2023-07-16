import 'package:flutter/material.dart';
import 'package:assignment_2/necessary_classes.dart';

class popPup extends StatefulWidget {
  const popPup({super.key});

  @override
  State<popPup> createState() => _popPupState();
}

class _popPupState extends State<popPup> {
  String category = ' ';
  int amount = 0;
  List<Expense> expenses = [];
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      title: Text(
        'New Entry',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          wordSpacing: 7,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                category = value;
              });
            },
            decoration: InputDecoration(labelText: 'Category'),
          ),
          SizedBox(height: 16),
          TextField(
            onChanged: (value) {
              setState(() {
                amount = int.tryParse(value) ?? 0;
              });
            },
            decoration: InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        IconButton(
          tooltip: 'save',
          onPressed:(){
            savedata(category,amount,expenses);
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.done,
          color: Colors.white,),
        )
      ],
    );
  }
}
void savedata(String category,int amt,List<Expense> expenses){
  Expense new_exp = Expense(category: category, amount: amt);
  expenses.add(new_exp);
}




/*Widget poPup(){
  return Stack(
    children: [Center(
      child: Container(
        padding: const EdgeInsets.all(15),
        width: 400,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.deepPurple[900],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New Entry',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    wordSpacing: 7,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Category:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Price:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: (){},
                tooltip: 'save',
                backgroundColor: Colors.deepPurple[700],
                child: const Icon(Icons.done,
                  color: Colors.white,),
              ),
            )
          ],
        ),
      ),
    )],
  );
}*/
