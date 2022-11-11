import 'package:flutter/material.dart';
import 'package:mevolve/util/app_colors.dart';
import 'package:mevolve/util/app_constant.dart';
import 'package:mevolve/widgets/custom_bottomsheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mevolve Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> yearList = ["1000", "2000", "3000"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                showCustomBottomsheet(context, AppConstant.addTodo);
              },
              child: const Text(AppConstant.addTodo),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                showCustomBottomsheet(context, AppConstant.addHabit);
              },
              child: const Text(AppConstant.addHabit),
            ),
          ],
        ));
  }
}
