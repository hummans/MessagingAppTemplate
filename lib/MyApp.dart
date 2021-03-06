import 'package:flutter/material.dart';
import 'package:messaging_demo_flutter/Core/ChangeNotifiers/AuthenticationNotifier.dart';
import 'package:messaging_demo_flutter/Core/ChangeNotifiers/ChatRoomNotifier.dart';
import 'package:messaging_demo_flutter/Core/ChangeNotifiers/FriendsListNotifier.dart';
import 'package:messaging_demo_flutter/Core/ChangeNotifiers/LoginNotifier.dart';
import 'package:messaging_demo_flutter/Core/ChangeNotifiers/ProfileNotifier.dart';
import 'package:messaging_demo_flutter/Core/ChangeNotifiers/ThemeNotifier.dart';
import 'package:messaging_demo_flutter/UI/Screens/ChatRoomScreen.dart';
import 'package:messaging_demo_flutter/UI/Screens/LoginScreen.dart';
import 'package:messaging_demo_flutter/UI/Screens/ProfileScreen.dart';
import 'package:provider/provider.dart';

import 'UI/Screens/FriendsListScreen.dart';
import 'UI/Screens/SplashScreen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider<AuthenticationNotifier>(
            create: (_) => AuthenticationNotifier()),
        ChangeNotifierProvider<LoginNotifier>(create: (_) => LoginNotifier()),
        ChangeNotifierProvider<FriendsListNotifier>(
            create: (_) => FriendsListNotifier()),
        ChangeNotifierProvider<ChatRoomNotifier>(
            create: (_) => ChatRoomNotifier()),
        ChangeNotifierProvider<ProfileNotifier>(
            create: (_) => ProfileNotifier()),
      ],
      child: MsMaterialApp(),
    );
  }
}

class MsMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: model.currentThemeData,
      routes: {
        SplashScreen.Route: (context) => SplashScreen(),
        LoginScreen.Route: (context) => LoginScreen(),
        FriendsListScreen.Route: (context) => FriendsListScreen(),
        ChatRoomScreen.Route: (context) => ChatRoomScreen(
              friend: ModalRoute.of(context).settings.arguments,
            ),
        ProfileScreen.Route: (context) => ProfileScreen(),
      },
      home: SplashScreen(),
    );
  }
}
