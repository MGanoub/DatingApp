import 'dart:ffi';

import 'package:dating_app/screens/onboarding/widgets/custom_textfield.dart';
import 'package:dating_app/screens/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Bio extends StatelessWidget {
  final TabController tabController;
  const Bio({super.key, required this.tabController});

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
                  tabController: tabController,
                  text: "Describe Yourself a bit"),
              SizedBox(height: 10),
              CustomTextField(
                  tabController: tabController, text: "ENTER YOUR BIO"),
              SizedBox(height: 100),
              CustomTextHeader(
                  tabController: tabController, text: "What Do You Like?"),
              Wrap(
                children: [
                  CustomTextContainer(
                      tabController: tabController, text: "MUSIC"),
                  CustomTextContainer(
                      tabController: tabController, text: "ECONOMICS"),
                  CustomTextContainer(
                      tabController: tabController, text: "SPORTS"),
                  CustomTextContainer(
                      tabController: tabController, text: "ART"),
                  CustomTextContainer(
                      tabController: tabController, text: "FOOTBALL"),
                  CustomTextContainer(
                      tabController: tabController, text: "NATURE"),
                ],
              ),
            ],
          ),
          Column(
            children: [
              StepProgressIndicator(
                  totalSteps: tabController.length,
                  currentStep: tabController.index + 1,
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
            ],
          ),
        ],
      ),
    );
  }
}
