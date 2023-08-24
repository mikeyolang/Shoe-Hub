import 'package:flutter/material.dart';

class StaggerTile extends StatefulWidget {
  const StaggerTile({super.key});

  @override
  State<StaggerTile> createState() => _StaggerTileState();
}

class _StaggerTileState extends State<StaggerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[500],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(padding: EdgeInsets.all(8), child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CatchedNetworkImage()
        ],
      ),),
    );
  }
}