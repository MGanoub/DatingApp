import 'package:flutter/material.dart';

class CustomImageContainer extends StatelessWidget {
  final TabController tabController;
  const CustomImageContainer({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, right: 10.0),
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border(
              bottom:
                  BorderSide(color: Theme.of(context).primaryColor, width: 1),
              top: BorderSide(color: Theme.of(context).primaryColor, width: 1),
              left: BorderSide(color: Theme.of(context).primaryColor, width: 1),
              right:
                  BorderSide(color: Theme.of(context).primaryColor, width: 1)),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_circle,
                  color: Theme.of(context).colorScheme.secondary)),
        ),
      ),
    );
  }
}
