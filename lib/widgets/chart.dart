// ignore_for_file: prefer_const_constructors
import 'package:app_spese/models/transaction.dart';
import 'package:app_spese/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  // i getter sono quelle proprietà che voglio calcolare dinamicamente
  List<Map<String, Object>> get groupedTransacionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      //aggiungo substring per avere solo la lettera iniziale del giorno
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get totalSpending {
    return groupedTransacionValues.fold(0, (previousValue, element) {
      return previousValue + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransacionValues.map((data) {
          return ChartBar(data['day'] as String, data['amount'] as double,
              (data['amount'] as double) / totalSpending);
        }).toList(),
      ),
    );
  }
}
