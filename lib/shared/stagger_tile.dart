import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import './appstyle.dart' as style;

class StaggerTile extends StatefulWidget {
  const StaggerTile(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.price});
  final String imageUrl;
  final String name;
  final String price;
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
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: widget.imageUrl,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.only(top: 12),
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: style.appStyleWithHeight(
                        20, Colors.black, FontWeight.bold, 1),
                  ),
                  Text(
                    widget.price,
                    style: style.appStyleWithHeight(
                        20, Colors.black, FontWeight.bold, 1),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
