import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeatureWidget extends StatelessWidget {
  FeatureWidget(
      {Key? key,
      required this.iconPath,
      required this.title,
      required this.titleStyle})
      : super(key: key);

  final String iconPath;
  final String title;
  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        children: [
          SizedBox(height: 20, width: 20, child: SvgPicture.asset(iconPath)),
          const SizedBox(
            width: 12,
          ),
          Text(
            title,
            style: titleStyle,
          )
        ],
      ),
    );
  }
}
