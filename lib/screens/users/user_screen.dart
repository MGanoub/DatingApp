import 'package:dating_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../models/models.dart';

class UsersScreen extends StatelessWidget {
  static const String routeName = '/users';

  static Route route({required User user}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => UsersScreen(user: user));
  }

  final User user;
  const UsersScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Hero(
                  tag: "user_card",
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(user.imageUrls[0]),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ChoiceButton(
                          color: Theme.of(context).colorScheme.secondary,
                          icon: Icons.clear_rounded),
                      ChoiceButton(
                          height: 80,
                          width: 80,
                          color: Colors.white,
                          size: 30,
                          hasGradient: true,
                          icon: Icons.favorite),
                      ChoiceButton(
                          color: Theme.of(context).colorScheme.primary,
                          icon: Icons.watch_later),
                    ],
                  ),
                ),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}, ${user.age}',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  '${user.jobTitle}',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 15),
                Text('About', style: Theme.of(context).textTheme.headline3),
                Text('${user.bio}',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.normal, height: 2)),
                SizedBox(height: 15),
                Text('Interest', style: Theme.of(context).textTheme.headline3),
                Row(
                  children: user.interests
                      .map(
                        (interest) => Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(colors: [
                                Theme.of(context).primaryColor,
                                Theme.of(context).colorScheme.secondary
                              ])),
                          child: Text(
                            interest,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
