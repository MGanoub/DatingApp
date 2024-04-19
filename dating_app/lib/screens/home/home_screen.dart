import 'package:dating_app/blocs/bloc/swipe_bloc.dart';
import 'package:dating_app/config/theme.dart';
import 'package:dating_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/widgets.dart';

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
      body: BlocBuilder<SwipeBloc, SwipeState>(
        builder: (context, state) {
          if (state is SwipeLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SwipeLoaded) {
            return Column(
              children: [
                Draggable(
                  feedback: UserCard(user: state.users[0]),
                  child: UserCard(user: state.users[0]),
                  childWhenDragging: state.users.length > 1
                      ? UserCard(user: state.users[1])
                      : Container(),
                  onDragEnd: (drag) {
                    if (drag.offset.dx < 0) {
                      context.read<SwipeBloc>()
                        ..add(SwipeLeftEvent(user: state.users[0]));
                      print('Swiped Left');
                    } else {
                      context.read<SwipeBloc>()
                        ..add(SwipeRightEvent(user: state.users[0]));
                      print('Swiped Right');
                    }
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<SwipeBloc>()
                            ..add(SwipeLeftEvent(user: state.users[0]));
                        },
                        child: ChoiceButton(
                            width: 60,
                            height: 60,
                            size: 25,
                            color: Theme.of(context).colorScheme.secondary,
                            icon: Icons.clear_rounded,
                            hasGradient: false),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<SwipeBloc>()
                            ..add(SwipeRightEvent(user: state.users[0]));
                        },
                        child: ChoiceButton(
                            width: 80,
                            height: 80,
                            size: 30,
                            color: Colors.white,
                            icon: Icons.favorite,
                            hasGradient: true),
                      ),
                      ChoiceButton(
                        width: 60,
                        height: 60,
                        size: 25,
                        color: Theme.of(context).primaryColor,
                        icon: Icons.watch_later,
                        hasGradient: false,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Text("Something wrong");
          }
        },
      ),
    );
  }
}
