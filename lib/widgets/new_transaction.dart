import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount);
    //per far chiudere da solo il foglio di input dopo che premiamo invio
    Navigator.of(context).pop();
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
              onSubmitted: (_) => submitData
              // onChanged: (val) {
              //   titleInput = val;
              // },
              ),
          TextField(
              decoration: InputDecoration(labelText: 'Prezzo'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              // potrebbe funzionare anche solo scrivendo TextInputType.number ma meglio specificare per iOS
              onSubmitted: (_) => submitData
              // onChanged: (val) {
              //   amountInput = val;
              // },
              ),
          TextButton(
              onPressed: submitData,
              //riesco a vedere questo metodo privato di user_transaction grazie alle righe 8 e 9
              child: Text('Aggiungi'))
        ]),
      ),
    );
  }
}
