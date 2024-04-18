import 'package:dating_app/config/theme.dart';
import 'package:dating_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) {
          return HomeScreen();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: UserCard(user: User.users[0]),
    );
  }
}

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.4,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(user.imageUrls[0]),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: Offset(3, 3))
                  ]),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 20,
              child: Column(
                children: [
                  Text(
                    "${user.name}, ${user.age}",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                  Text("${user.jobTitle}",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                      textAlign: TextAlign.left),
                ],
              ),
            ),
            Row(
              children: [Container()],
            )
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Expanded(
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              height: 50,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'DISCOVER',
              style: Theme.of(context).textTheme.headline2,
            ),
          )
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.message, color: Theme.of(context).primaryColor)),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.person, color: Theme.of(context).primaryColor)),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.0);
}
