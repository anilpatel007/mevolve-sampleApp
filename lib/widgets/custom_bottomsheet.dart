import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mevolve/util/app_colors.dart';
import 'package:mevolve/util/app_constant.dart';
import 'package:mevolve/util/image_constant.dart';
import 'package:mevolve/util/styles.dart';
import 'package:mevolve/widgets/feature_widget.dart';
import 'package:mevolve/widgets/time-picker_widget.dart';
import 'package:mevolve/widgets/title_widget.dart';

void showCustomBottomsheet(context, String title) {
  bool showEditText = false;
  bool showBlue = false;
  final myController = TextEditingController();
  FocusNode topicFocus = FocusNode();
  bool enableTimer = false;
  DateTime _dateTime = DateTime.now();

  _showTimePicker() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Time",
                          style: globalStyle.copyWith(color: Colors.black),
                        ),
                        Switch(
                          activeColor: Colors.white,
                          activeTrackColor: Colors.blueAccent,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey.shade400,
                          splashRadius: 50.0,
                          value: enableTimer,
                          onChanged: (bool value) {
                            enableTimer = value;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    TimePickerWidget(
                      is24HourMode: false,
                      isEnable: enableTimer,
                      normalTextStyle:
                          TextStyle(fontSize: 18, color: AppColors.grayColor),
                      highlightedTextStyle: TextStyle(
                          fontSize: 32,
                          color:
                              enableTimer ? Colors.black : AppColors.grayColor),
                      spacing: 30,
                      onTimeChange: (time) {
                        // setState(() {
                        _dateTime = time;
                        // });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.watch_later_outlined,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "No Time",
                              style: globalStyle.copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Cancel",
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: Colors.blueAccent.withOpacity(0.1)),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Save")),
                          ],
                        )
                      ],
                    ),
                  ]);
                }),
              )
            ],
          );
        });
  }

  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(builder: (BuildContext context,
            StateSetter setState /*You can rename this!*/) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              clipBehavior: Clip.hardEdge,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: DraggableScrollableSheet(
                  initialChildSize: 1,
                  minChildSize: 0.95,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TitleWidget(
                          title: title,
                          textStyle: globalStyle,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showEditText = true;
                              FocusScope.of(context).requestFocus(topicFocus);
                            });
                          },
                          child: FeatureWidget(
                              iconPath: ImageConstant.iTitleGray,
                              title: AppConstant.hintText,
                              titleStyle: buttonStyle.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.gray94Color)),
                        ),
                        GestureDetector(
                          onTap: (){
                            _showTimePicker();
                          },
                          child: FeatureWidget(
                              iconPath: ImageConstant.iCalendar,
                              title: AppConstant.dueToday,
                              titleStyle: regularStyle),
                        ),
                        GestureDetector(
                          onTap: () {
                            _showTimePicker();
                          },
                          child: FeatureWidget(
                              iconPath: ImageConstant.iClock,
                              title: AppConstant.noTime,
                              titleStyle: regularStyle),
                        ),
                        Expanded(
                            child: Align(
                          alignment: Alignment.bottomCenter,
                          child: showEditText
                              ? TextField(
                                  keyboardType: TextInputType.text,
                                  autofocus: showEditText,
                                  focusNode: topicFocus,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.grayColor, width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.grayColor, width: 1.0),
                                    ),
                                    suffixIcon: InkWell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: SizedBox(
                                            height: 20,
                                            child: SvgPicture.asset(showBlue
                                                ? ImageConstant.iBlueTick
                                                : ImageConstant.iGrayTick),
                                          ),
                                        ),
                                        onTap: () {}),
                                    hintText: 'e.g, Meeting with Alex',
                                    hintStyle: buttonStyle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: AppColors.gray94Color),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: AppColors.gray94Color),
                                    ),
                                  ),
                                  controller: myController,
                                  onSubmitted: (_) {
                                    setState(() {
                                      showEditText = false;
                                    });
                                  },
                                  onChanged: (value) {
                                    if (value.length > 0) {
                                      setState(() {
                                        showBlue = true;
                                      });
                                    }else{
                                      setState(() {
                                        showBlue = false;
                                      });
                                    }
                                  },
                                )
                              : Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, top: 24.0, bottom: 24.0),
                                      child: SvgPicture.asset(
                                          ImageConstant.iLines),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 24.0, top: 24.0, bottom: 24.0),
                                      child: SvgPicture.asset(
                                          ImageConstant.iRepeat),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 24.0, top: 24.0, bottom: 24.0),
                                      child:
                                          SvgPicture.asset(ImageConstant.iHash),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 24.0, top: 24.0, bottom: 24.0),
                                      child: SvgPicture.asset(
                                          ImageConstant.iImage),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 75,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          elevation:
                                              MaterialStateProperty.all<double>(
                                                  0.0),
                                          shadowColor:
                                              MaterialStateProperty.all<Color>(
                                            Colors.transparent,
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  AppColors.lightBlueColor),
                                        ),
                                        onPressed: () {},
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              top: 12, bottom: 12),
                                          child: Text(
                                            'Cancel',
                                            style: buttonStyle,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 11,
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 75,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          elevation:
                                              MaterialStateProperty.all<double>(
                                                  0.0),
                                          shadowColor:
                                              MaterialStateProperty.all<Color>(
                                            Colors.transparent,
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  AppColors.grayColor),
                                        ),
                                        onPressed: () {},
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 12, bottom: 12),
                                          child: Text(
                                            'Save',
                                            style: buttonStyle.copyWith(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        )),
                        Padding(
                            // this is new
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom)),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        });
      });
}
