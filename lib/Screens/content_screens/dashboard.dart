import 'package:flutter/material.dart';

import '../../widgets/custom_scaffold_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // ignore: unused_field
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double getDelay(int index) {
    const delayFraction = 0.1;
    return index * delayFraction;
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return CustomScaffoldPage(
        appBarTitle: "Dashboard",
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            final itemAnimation = Tween<Offset>(
              begin: (screenWidth < 600)
                  ? const Offset(-1, 0)
                  : const Offset(0.3, 0),
              end: const Offset(0, 0),
            ).animate(
              CurvedAnimation(
                parent: _controller,
                curve: Interval(
                  getDelay(index),
                  1.0,
                  curve: Curves.easeInOut,
                ),
              ),
            );
            return SlideTransition(
              position: itemAnimation,
              child: Card(
                child: ListTile(
                  tileColor: Colors.black,
                  title: Text(
                    'Item ${index + 1}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
