import 'package:dating_app/screens/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Email extends StatelessWidget {
  final TabController tabController;
  const Email({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CustomTextHeader(
                  tabController: tabController,
                  text: "What\'s your Email address?"),
              CustomTextField(
                  tabController: tabController,
                  text: "ENTER YOUR EMAIL ADDRESS"),
            ],
          ),
          CustomButton(
            tabController: tabController,
            text: "Next Step",
            onPressed: () {
              tabController.animateTo(tabController.index + 1);
            },
          )
        ],
      ),
    );
  }
}
