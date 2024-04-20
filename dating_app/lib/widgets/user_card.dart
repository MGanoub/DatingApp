import 'package:dating_app/models/user_model.dart';
import 'package:dating_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "user_card",
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.4,
          width: MediaQuery.of(context).size.width - 40,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${user.name}, ${user.age}",
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "${user.jobTitle}",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      children: [
                        UserImageSmall(imageUrl: user.imageUrls[1]),
                        UserImageSmall(imageUrl: user.imageUrls[2]),
                        UserImageSmall(imageUrl: user.imageUrls[3]),
                        UserImageSmall(imageUrl: user.imageUrls[4]),
                        SizedBox(width: 10),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Icon(Icons.info_outline,
                              size: 25, color: Theme.of(context).primaryColor),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
