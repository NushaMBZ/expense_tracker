import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget{
  const NewExpense({super.key});
  
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense>{
  var _enteredTitle = '';

  void _saveTitleInput(String inputValue){
    _enteredTitle = inputValue;
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            onChanged: _saveTitleInput,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print(_enteredTitle);
                },
                child: Text('Save Expense'),
              ),
            ],
          )
        ],
      )
    );
  }
} 