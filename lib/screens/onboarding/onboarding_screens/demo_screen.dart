import 'package:dating_app/screens/onboarding/widgets/custom_textfield.dart';
import 'package:dating_app/screens/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Demo extends StatelessWidget {
  final TabController tabController;
  const Demo({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextHeader(
                  tabController: tabController, text: "What\'s Your Gender?"),
              SizedBox(height: 10),
              CustomCheckbox(tabController: tabController, text: "MALE"),
              CustomCheckbox(tabController: tabController, text: "FEMALE"),
              SizedBox(height: 100),
              CustomTextHeader(
                  tabController: tabController, text: "What\'s Your Age?"),
              SizedBox(height: 10),
              CustomTextField(
                  tabController: tabController, text: "ENTER YOUR AGE"),
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
