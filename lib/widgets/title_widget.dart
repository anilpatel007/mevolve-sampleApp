import 'package:flutter/material.dart';
import 'package:mevolve/util/app_colors.dart';

class TitleWidget extends StatelessWidget {
  TitleWidget({Key? key, required this.title, required this.textStyle})
      : super(key: key);

  final String title;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 12),
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}
