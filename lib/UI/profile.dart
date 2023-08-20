import 'package:flutter/material.dart';
import 'package:shoehub/shared/appstyle.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "ProfilePage",
          style: appstyle(30, Colors.black, FontWeight.w400),
        ),
      ),
    );
  }
}
