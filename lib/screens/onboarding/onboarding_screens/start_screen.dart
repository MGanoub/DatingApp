import 'package:dating_app/screens/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Start extends StatelessWidget {
  final TabController tabController;
  const Start({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                child: SvgPicture.asset("assets/images/couple.svg"),
              ),
              SizedBox(height: 50),
              Text("Welcome to Arrow",
                  style: Theme.of(context).textTheme.headline2),
              SizedBox(height: 20),
              Text(
                  'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(height: 1.8),
                  textAlign: TextAlign.center),
            ],
          ),
          CustomButton(
            tabController: tabController,
            text: "START",
            onPressed: () {
              tabController.animateTo(tabController.index + 1);
            },
          )
        ],
      ),
    );
  }
}
