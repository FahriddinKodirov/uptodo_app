import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Radio_widget extends StatefulWidget {
  const Radio_widget({super.key});

  @override
  State<Radio_widget> createState() => _Radio_widgetState();
}

class _Radio_widgetState extends State<Radio_widget> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Radio(
        value: 1,
        groupValue: index,
        onChanged: (value) {
          setState(() {
           index = value as int; 
          });
          
        },
        )
    );
  }
}