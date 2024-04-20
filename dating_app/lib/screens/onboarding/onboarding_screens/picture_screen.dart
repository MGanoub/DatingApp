import 'package:dating_app/screens/onboarding/widgets/custom_textfield.dart';
import 'package:dating_app/screens/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Picture extends StatelessWidget {
  final TabController tabController;
  const Picture({super.key, required this.tabController});

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
                  tabController: tabController, text: "Add 2 or more Pictures"),
              SizedBox(height: 10),
              Row(children: [
                CustomImageContainer(tabController: tabController),
                CustomImageContainer(tabController: tabController),
                CustomImageContainer(tabController: tabController),
              ]),
              Row(
                children: [
                  CustomImageContainer(tabController: tabController),
                  CustomImageContainer(tabController: tabController),
                  CustomImageContainer(tabController: tabController),
                ],
              ),
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
