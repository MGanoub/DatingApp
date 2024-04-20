import 'package:flutter/material.dart';

class CustomTextContainer extends StatelessWidget {
  final TabController tabController;
  final String text;
  const CustomTextContainer(
      {super.key, required this.tabController, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0, right: 5.0),
        child: Container(
          height: 30,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).colorScheme.secondary
              ])),
          child: Center(
            widthFactor: 1,
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
            ),
          ),
        ));
  }
}
