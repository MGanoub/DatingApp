import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;
  final String text;
  Function()? onPressed;
  CustomButton(
      {super.key,
      required this.tabController,
      required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).colorScheme.secondary
          ])),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Container(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Center(
                child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.white),
            ))),
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )),
      ),
    );
  }
}
