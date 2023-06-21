import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:responsive_web_app/provider/provider.dart';
import '../home_screen/app_navigation_bar.dart';

class CustomScaffoldPage extends StatelessWidget {
  const CustomScaffoldPage(
      {super.key,
      required this.appBarTitle,
      this.body,
      this.actions,
      this.floatingActionButton});
  final String appBarTitle;
  final Widget? body;
  final List<Widget>? actions;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider = context.watch<SampleProvider>();
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawerScrimColor: Colors.transparent,
      backgroundColor: const Color(0xff39444F),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appBarTitle,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18.spMin,
              fontWeight: FontWeight.w600),
        ),
        leading: (size.width > 600)
            ? IconButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xff263743),
                  ),
                ),
                onPressed: () {
                  if (provider.isAppbarCollapsed == true) {
                    provider.setIsAppBarCollapsed(false);
                  } else {
                    provider.setIsAppBarCollapsed(true);
                  }
                },
                icon: const Icon(Icons.menu),
                color: Colors.white,
              )
            : IconButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xff263743),
                  ),
                ),
                icon: Icon(Icons.menu_rounded,
                    color: Colors.white, size: 24.spMin),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        backgroundColor: const Color(0xff293238),
        actions: actions,
      ),
      drawer: (size.width < 600)
          ? const Drawer(
              child: AppNavigationBar(),
            )
          : null,
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
