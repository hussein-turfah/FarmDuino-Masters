import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double width;
  final double? height;
  final Widget body;
  final Color backgroundColor;
  final bool? withShadow;
  const CustomContainer({
    super.key,
    required this.body,
    required this.width,
    this.height,
    required this.backgroundColor,
    this.withShadow,
  });

  @override
  Widget build(BuildContext context) {
    return (withShadow == null || withShadow == true)
        ? Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: body,
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              width: width,
              height: height,
              color: backgroundColor,
              child: body,
            ),
          );
  }
}
