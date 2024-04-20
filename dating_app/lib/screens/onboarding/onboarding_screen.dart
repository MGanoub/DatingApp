import 'package:dating_app/screens/onboarding/onboarding_screens/screens.dart';
import 'package:dating_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dating_app/screens/screens.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = '/onboarding';
  const OnboardingScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => OnboardingScreen(),
    );
  }

  static const List<Tab> tabs = <Tab>[
    Tab(text: "Start"),
    Tab(text: "Email"),
    Tab(text: "Email_verification"),
    Tab(text: "Demo"),
    Tab(text: "Picture"),
    Tab(text: "Bio"),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Builder(builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {}
          });
          return Scaffold(
            appBar: CustomAppBar(
              title: 'ARROW',
              hasActions: false,
            ),
            body: TabBarView(
              children: [
                Start(
                  tabController: tabController,
                ),
                Email(
                  tabController: tabController,
                ),
                EmailVerification(
                  tabController: tabController,
                ),
                Demo(
                  tabController: tabController,
                ),
                Picture(
                  tabController: tabController,
                ),
                Bio(
                  tabController: tabController,
                ),
              ],
            ),
          );
        }));
  }
}
