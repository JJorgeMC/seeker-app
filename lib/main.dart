import 'package:flutter/material.dart';
import 'package:seeker_app/Screens/Auth/auth_screen.dart';
import 'package:seeker_app/Screens/DisappearanceDetail/disappearance_detail_screen.dart';
import 'package:seeker_app/Screens/EditDisappearance/edit_disappearance_screen.dart';
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
        // canvasColor: Colors.transparent,
        primaryColor: Color(0xFF5DD39E),
        accentColor: Color(0xFF525174),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
      ),
      home: TabsScreen(),
      routes: {
        DisappearanceDetailScreen.routeName: (ctx) =>
            DisappearanceDetailScreen(),
        EditDisappearanceScreen.routeName: (ctx) => EditDisappearanceScreen(),
      },
    );
  }
}
