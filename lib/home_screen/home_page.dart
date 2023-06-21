import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_web_app/content_screens/contacts.dart';
import 'package:responsive_web_app/content_screens/dashboard.dart';
import 'package:responsive_web_app/content_screens/organization.dart';
import 'package:responsive_web_app/content_screens/profile.dart';
import 'package:responsive_web_app/content_screens/route.dart' as route_widget;
import 'package:responsive_web_app/content_screens/users.dart';
import 'package:responsive_web_app/provider/provider.dart';
import 'app_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget checkConditionAndReturnWidget(SampleProvider provider) {
    switch (provider.selectedNavItem) {
      case 'Dashboard':
        return const Dashboard();
      case 'Route':
        return const route_widget.Route();
      case 'Organization':
        return const Organization();
      case 'Users':
        return const Users();
      case 'Contacts':
        return const Contacts();
      case 'My Profile':
        return const Profile();
      default:
        return const Dashboard();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider = context.watch<SampleProvider>();
    return SafeArea(
      child: Scaffold(
        drawer: size.width < 600
            ? const Drawer(
                backgroundColor: Color(0xff293238), child: AppNavigationBar())
            : null,
        body: Center(
          child: (size.width < 600)
              ? checkConditionAndReturnWidget(provider)
              : Row(
                  children: [
                    Consumer<SampleProvider>(
                      builder: (context, value, child) => AnimatedContainer(
                        width: (value.isAppbarCollapsed == false) ? 240 : 80,
                        duration: const Duration(milliseconds: 300),
                        color: const Color(0xff293238),
                        child: const AppNavigationBar(),
                      ),
                    ),
                    Expanded(
                      child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: (provider.isAppbarCollapsed)
                              ? size.width - 80
                              : size.width - 240,
                          child: checkConditionAndReturnWidget(provider)),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
