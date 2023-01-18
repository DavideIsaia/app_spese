import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;
  NewTransaction(this.addTx);

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
            // onChanged: (val) {
            //   titleInput = val;
            // },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Prezzo'),
            controller: amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true), // potrebbe funzionare anche solo scrivendo TextInputType.number ma meglio specificare per iOS
            // onChanged: (val) {
            //   amountInput = val;
            // },
          ),
          TextButton(
              onPressed: () {
                //riesco a vedere questo metodo privato di user_transaction grazie alle righe 8 e 9
                addTx(
                    titleController.text, double.parse(amountController.text));
              },
              child: Text('Aggiungi'))
        ]),
      ),
    );
  }
}
