import 'package:expense/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  /*var _enteredTitle = '';
  void _saveTitleInput(String inputValue) {
     _enteredTitle = inputValue;
  }*/ //alternative
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  } //dispose controller when not in use

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
            context: context,
            initialDate: now,
            firstDate: firstDate,
            lastDate: now)
        .then((value) {});
    setState(() {
      _selectedDate = pickedDate;
    });
  }

void _submitExpenseData(){
  final enteredAmount = double.tryParse(_amountController.text);
  final amountIsInvalid = enteredAmount==null || enteredAmount <= 0;
  if(_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate==null){
    // show error message
    showDialog(context: context, builder: (ctx) => AlertDialog(
      title: const Text('Invalid Text'),
      content: const Text('Please make sure a valid title, amount, date and category was entered'),
    actions: [
      TextButton(onPressed: (){
        Navigator.pop(ctx);
      }, child: const Text('OK'))
    ],
    ),);
    return; //to make sure no further code executes after getting error dialog
  }
  widget.onAddExpense(Expense(title: _titleController.text, amount: enteredAmount, date: _selectedDate!, category: _selectedCategory));
  Navigator.pop(context);
}//if after removing white spaces(trim) is empty,
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          Expanded(
            child: TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
            ),
          ),
          // keyboardType: TextInputType.text,
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 500,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? 'No Date Selected'
                        : formatter.format(_selectedDate!)),
                    IconButton(
                      icon: const Icon(
                        Icons.calendar_month,
                      ),
                      onPressed: _presentDatePicker,
                    ),
                  ],
                ),
              ), //use expanded when row inside row
            ],
          ),
          
  const SizedBox(height: 16),        
          Row(
            children: [

              DropdownButton(
                value: _selectedCategory,
                  items: Category.values.map(
                    (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(),
                        ),
                      ),
                      ).toList(),
                  onChanged: (value) {
                    if(value==null){
                      return;
                    }
                    setState(() {
                      _selectedCategory=value;
                    });
                  }),

const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context); //closes whole widget tree
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text('Save expense'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
