import 'package:expense/models/expense.dart';
import 'package:expense/widgets/chart/chart.dart';
import 'package:expense/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget{
const   Expenses({super.key});

@override
State<Expenses> createState(){
  return _ExpensesState();
}
}

class _ExpensesState extends State<Expenses>{
  //ithe list bhartoy
  final List<Expense> _registeredExpenses = [
    Expense( 
    title: 'Flutter Course',
    amount: 19.99,
    date: DateTime.now(),
    category: Category.work,
    ),
    Expense( 
    title: 'Cinema',
    amount: 15.69,
    date: DateTime.now(),
    category: Category.leisure,
    ),
  ];

  void _addExpense(Expense expense){
  setState(() {
    _registeredExpenses.add(expense);
  });
}

void _removeExpense(Expense expense) {
final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

ScaffoldMessenger.of(context).clearSnackBars();
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(seconds: 3),
    content: const Text("Expense deleted"),
       action: SnackBarAction(label: "Undo", onPressed: (){
        setState(() {
          _registeredExpenses.insert(expenseIndex, expense);
        });
       }),
       )
       );
  }

void _openAddExpenseOverlay(){

//  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>NewExpense(onAddExpense: _addExpense)));
showModalBottomSheet(
   //isScrollControlled: true,
  context: context, 
  builder: (ctx) => NewExpense(onAddExpense: _addExpense,),
);
}



@override
Widget build(BuildContext context){
Widget mainContent = const Center(child: Text("No expenses found. Start adding new!"),);

if(_registeredExpenses.isNotEmpty){
mainContent = ExpensesList(expenses: _registeredExpenses, onRemoveExpense: _removeExpense);
}

  return Scaffold(
    appBar: AppBar(
      title: const Text('Flutter Expense Tracker'),
      actions: [
        IconButton(
          onPressed: _openAddExpenseOverlay, 
        icon: const Icon(Icons.add),
        )
      ],
    ),
    body: Column(
      children: [
        Chart(expenses: _registeredExpenses),
      //  const Text("Expenses List..."),
        Expanded(child: mainContent),
      ],
    ),
  );
}
}