import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:responsive_web_app/home_screen/app_navigation_bar.dart';
import 'package:responsive_web_app/provider/provider.dart';

class ContentWidget extends StatelessWidget {
  final List<String> elements = [
    "Zero",
    "One",
    "Two",
    "Three",
    "Four",
    "Five",
    "Six",
    "Seven",
    "Eight",
    "A Million Billion Trillion",
    "A much, much longer text that will still fit"
  ];

  ContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider = context.watch<SampleProvider>();
    return Scaffold(
      appBar: AppBar(
        leading: (size.width > 600)
            ? IconButton(
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
            : null,
        backgroundColor: const Color(0xff293238),
        title: Text(
          "Responsive Web App",
          style: TextStyle(
            fontSize: 15.spMin,
            color: Colors.white,
          ),
        ),
      ),
      drawer: (size.width < 600) ? const AppNavigationBar() : null,
      body: GridView.builder(
        itemCount: elements.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 130.0,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        itemBuilder: (context, i) => Card(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(elements[i]),
            ),
          ),
        ),
      ),
    );
  }
}
