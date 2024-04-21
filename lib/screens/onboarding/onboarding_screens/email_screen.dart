import 'package:dating_app/screens/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

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
          Column(children: [
            StepProgressIndicator(
                totalSteps: tabController.length,
                currentStep: tabController.index,
                selectedColor: Theme.of(context).primaryColor,
                unselectedColor: Theme.of(context).backgroundColor),
            SizedBox(height: 10),
            CustomButton(
              tabController: tabController,
              text: "Next Step",
              onPressed: () {
                tabController.animateTo(tabController.index + 1);
              },
            )
          ]),
        ],
      ),
    );
  }
}
