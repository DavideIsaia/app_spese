import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle, 
      enteredAmount,
      _selectedDate
      );
    //per far chiudere da solo il foglio di input dopo che premiamo invio
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
              decoration: InputDecoration(labelText: 'Nome'),
              controller: titleController,
              onSubmitted: (_) => _submitData
              // onChanged: (val) {
              //   titleInput = val;
              // },
              ),
          TextField(
              decoration: InputDecoration(labelText: 'Prezzo'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              // potrebbe funzionare anche solo scrivendo TextInputType.number ma meglio specificare per iOS
              onSubmitted: (_) => _submitData
              // onChanged: (val) {
              //   amountInput = val;
              // },
              ),
          Container(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(_selectedDate == null
                      ? 'Nessuna data selezionata'
                      : 'Data selezionata: ${DateFormat('dd/MMM/yy').format(_selectedDate!)}'),
                ),
                TextButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Seleziona una data',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
          ElevatedButton(
              onPressed: _submitData,
              //riesco a vedere questo metodo privato di user_transaction grazie alle righe 8 e 9
              child: Text('Aggiungi'))
        ]),
      ),
    );
  }
}
