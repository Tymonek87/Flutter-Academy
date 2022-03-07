import 'package:flutter/material.dart';
import 'package:tomasz_krason_flutter_academy_task_zero/widgets/grid_view_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: GridViewWidget(),
      ),
    );
  }
}
