import 'package:flutter/material.dart';
import 'package:shoehub/shared/appstyle.dart';

class SearchPages extends StatefulWidget {
  const SearchPages({super.key});

  @override
  State<SearchPages> createState() => _SearchPagesState();
}

class _SearchPagesState extends State<SearchPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("SearchPages",
            style: appstyle(30, Colors.black, FontWeight.w400)),
      ),
    );
  }
}
