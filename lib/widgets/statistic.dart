import 'package:flutter/material.dart';

class Statistic extends StatelessWidget {
  const Statistic({
    Key? key,
    required this.count,
    required this.title,
  }) : super(key: key);

  final String count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(title),
        ],
      ),
    );
  }
}
