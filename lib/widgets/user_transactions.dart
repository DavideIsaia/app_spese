// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import './transaction_list.dart';
// import './new_transaction.dart';
// import '../models/transaction.dart';

// class UserTransactions extends StatefulWidget {
//   @override
//   State<UserTransactions> createState() => _UserTransactionsState();
// }

// class _UserTransactionsState extends State<UserTransactions> {
//   final List<Transaction> _userTransactions = [
//     Transaction(
//         id: 't1', title: 'Scarpe nuove', amount: 55.99, date: DateTime.now()),
//     Transaction(
//         id: 't1',
//         title: 'Spesa settimanale',
//         amount: 93.78,
//         date: DateTime.now())
//   ];

//   void _addNewTransaction(String txTitle, double txAmount) {
//     final newTx = Transaction(
//         id: DateTime.now().toString(),
//         title: txTitle,
//         amount: txAmount,
//         date: DateTime.now());

//     setState(() {
//       // _userTransactions è final e non const, quindi possiamo usare il .add
//       _userTransactions.add(newTx);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         NewTransaction(_addNewTransaction),//dentro le parentesi si va a riga 8 e 9 di new_transaction
//         TransactionList(_userTransactions),
//       ],
//     );
//   }
// }
