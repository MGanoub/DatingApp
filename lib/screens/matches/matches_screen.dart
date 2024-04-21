import 'package:dating_app/models/models.dart';
import 'package:dating_app/widgets/custom_appbar.dart';
import 'package:dating_app/widgets/user_image_small.dart';
import 'package:flutter/material.dart';

class MatchesScreen extends StatelessWidget {
  static const String routeName = '/matches';
  const MatchesScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => MatchesScreen());
  }

  @override
  Widget build(BuildContext context) {
    final inactiveMatches = UserMatchModel.matches
        .where((match) => match.userId == 1 && match.chat!.isEmpty)
        .toList();
    final activeMatches = UserMatchModel.matches
        .where((match) => match.userId == 1 && match.chat!.isNotEmpty)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(title: "MATCHES"),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your Likes', style: Theme.of(context).textTheme.headline4),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: inactiveMatches.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        UserImageSmall(
                            height: 70,
                            width: 70,
                            imageUrl: inactiveMatches[index]
                                .matchedUser
                                .imageUrls[0]),
                        Text(
                          inactiveMatches[index].matchedUser.name,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    );
                  }),
            ),
            SizedBox(height: 10),
            Text('Your Chats', style: Theme.of(context).textTheme.headline4),
            ListView.builder(
                itemCount: activeMatches.length,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return Row(
                    children: [
                      UserImageSmall(
                          height: 70,
                          width: 70,
                          imageUrl:
                              activeMatches[index].matchedUser.imageUrls[0]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(activeMatches[index].matchedUser.name,
                                style: Theme.of(context).textTheme.headline5),
                            Text(
                                activeMatches[index]
                                    .chat![0]
                                    .messages[activeMatches[index]
                                            .chat![0]
                                            .messages
                                            .length -
                                        1]
                                    .message,
                                style: Theme.of(context).textTheme.headline6),
                            Text(
                                activeMatches[index]
                                    .chat![0]
                                    .messages[activeMatches[index]
                                            .chat![0]
                                            .messages
                                            .length -
                                        1]
                                    .timeString,
                                style: Theme.of(context).textTheme.bodyText1),
                          ])
                    ],
                  );
                })),
          ],
        ),
      )),
    );
  }
}
