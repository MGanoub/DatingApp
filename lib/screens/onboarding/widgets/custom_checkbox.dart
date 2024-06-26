import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final TabController tabController;
  final String text;
  CustomCheckbox({super.key, required this.tabController, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (bool? newValue) {}),
        Text(text,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.normal)),
      ],
    );
  }
}
