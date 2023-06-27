import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_web_app/Screens/content_screens/contacts.dart';
import 'package:responsive_web_app/Screens/content_screens/dashboard.dart';
import 'package:responsive_web_app/Screens/content_screens/organization.dart';
import 'package:responsive_web_app/Screens/content_screens/profile.dart';
import 'package:responsive_web_app/Screens/content_screens/route.dart'
    as route_widget;
import 'package:responsive_web_app/Screens/content_screens/users.dart';
import 'package:responsive_web_app/provider/responsive_app_provider.dart';

import '../../Screens/home_screen/components/side_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.child,
  });
  final Widget? child;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget checkConditionAndReturnWidget(ResponsiveAppProvider provider) {
    switch (provider.selectedNavItem) {
      case 'Dashboard':
        return const Dashboard();
      case 'Route':
        return const route_widget.Route();
      case 'Organization':
        return Organization();
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
    var provider = context.watch<ResponsiveAppProvider>();
    return SafeArea(
      child: Scaffold(
        drawer: size.width < 600
            ? const Drawer(
                backgroundColor: Color(0xff293238),
                child: SideNavigationBar(),
              )
            : null,
        body: Center(
          child: (size.width < 600)
              ? checkConditionAndReturnWidget(provider)
              : Row(
                  children: [
                    Consumer<ResponsiveAppProvider>(
                      builder: (context, value, child) => AnimatedContainer(
                        width: (value.isAppbarCollapsed == false) ? 240 : 80,
                        duration: const Duration(milliseconds: 300),
                        color: const Color(0xff293238),
                        child: const SideNavigationBar(),
                      ),
                    ),
                    Expanded(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: (provider.isAppbarCollapsed)
                            ? size.width - 80
                            : size.width - 240,
                        child: widget.child ??
                            checkConditionAndReturnWidget(provider),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
