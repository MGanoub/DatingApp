import 'package:dating_app/blocs/bloc/swipe_bloc.dart';
import 'package:dating_app/config/app_router.dart';
import 'package:dating_app/config/theme.dart';
import 'package:dating_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                SwipeBloc()..add(LoadUsersEvent(users: User.users))),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DatingApp',
        theme: theme(),
        onGenerateRoute: Approuter.onGenerateRoute,
        initialRoute: MatchesScreen.routeName,
      ),
    );
  }
}
