import 'package:flutter/material.dart';
import 'package:seeker_app/Screens/Auth/auth_screen.dart';
import 'package:seeker_app/Screens/DisappearanceDetail/disappearance_detail_screen.dart';
import 'package:seeker_app/Screens/Tabs/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seeker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabsScreen(),
      routes: {
        DisappearanceDetailScreen.routeName: (ctx) =>
            DisappearanceDetailScreen(),
      },
    );
  }
}
