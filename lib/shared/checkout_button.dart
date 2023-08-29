import 'package:flutter/material.dart';
import 'package:shoehub/shared/appstyle.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key, required this.label, this.onTap,
  });
final String label;
final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black,
          ),
          child: Center(
            child: Text(
              label,
              style: appstyle(20, Colors.black, FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
