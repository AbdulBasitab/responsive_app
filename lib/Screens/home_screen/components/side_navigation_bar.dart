import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_web_app/Routes/router.dart';
import 'package:responsive_web_app/provider/responsive_app_provider.dart';

class SideNavigationBar extends StatelessWidget {
  const SideNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var provider = context.watch<ResponsiveAppProvider>();
    return ListView(
      padding: const EdgeInsets.only(left: 0, top: 12, bottom: 10).h,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.circle_rounded,
              color: Colors.amber,
            ),
            SizedBox(width: 8.spMin),
            Builder(builder: (context) {
              if (provider.isAppbarCollapsed) {
                return const SizedBox();
              } else {
                return Text(
                  "Print Media Connect",
                  style: TextStyle(
                    fontSize: 16.spMin,
                    color: Colors.white,
                  ),
                );
              }
            }),
          ],
        ),
        SizedBox(height: 20.spMin),
        Builder(
          builder: (context) {
            if (provider.isAppbarCollapsed && screenWidth > 600) {
              return Column(
                children: [
                  CustomListTile(
                    icon: Icons.dashboard_rounded,
                    title: "Dashboard",
                    color: Colors.white,
                    location: '/dashboard',
                    onTap: () {
                      provider.setSelectedItem("Dashboard");
                      context.pushNamed(RoutesName.dashboard);
                    },
                    isCollapsed: true,
                  ),
                  CustomListTile(
                    icon: Icons.content_paste,
                    title: "Route",
                    color: Colors.white,
                    location: '/route',
                    onTap: () {
                      provider.setSelectedItem("Route");
                      context.goNamed(RoutesName.route);
                    },
                    isCollapsed: true,
                  ),
                  CustomListTile(
                    icon: Icons.account_balance_outlined,
                    title: "Organization",
                    color: Colors.white,
                    location: '/organization',
                    onTap: () {
                      provider.setSelectedItem("Organization");
                      context.goNamed(RoutesName.organization);
                    },
                    isCollapsed: true,
                  ),
                  CustomListTile(
                    icon: Icons.group_rounded,
                    title: "Users",
                    location: '/users',
                    color: Colors.white,
                    onTap: () {
                      provider.setSelectedItem("Users");
                      context.goNamed(RoutesName.users);
                    },
                    isCollapsed: true,
                  ),
                  CustomListTile(
                    icon: Icons.menu_book_rounded,
                    title: "Contacts",
                    location: '/contacts',
                    color: Colors.white,
                    isCollapsed: true,
                    onTap: () {
                      provider.setSelectedItem("Contacts");
                      context.goNamed(RoutesName.contacts);
                    },
                  ),
                  CustomListTile(
                    icon: Icons.manage_accounts_outlined,
                    title: "My Profile",
                    color: Colors.white,
                    location: '/profile',
                    onTap: () {
                      provider.setSelectedItem("My Profile");
                      context.goNamed(RoutesName.profile);
                    },
                    isCollapsed: true,
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  CustomListTile(
                    icon: Icons.dashboard_rounded,
                    title: "Dashboard",
                    color: Colors.white,
                    location: '/dashboard',
                    isCollapsed: false,
                    onTap: () {
                      provider.setSelectedItem("Dashboard");
                      if (Scaffold.maybeOf(context)?.hasDrawer ?? false) {
                        Navigator.of(context).pop();
                      }
                      context.goNamed(RoutesName.dashboard);
                    },
                  ),
                  CustomListTile(
                    icon: Icons.content_paste,
                    title: "Route",
                    location: '/route',
                    color: Colors.white,
                    isCollapsed: false,
                    onTap: () {
                      provider.setSelectedItem("Route");
                      if (Scaffold.maybeOf(context)?.hasDrawer ?? false) {
                        Navigator.of(context).pop();
                      }
                      context.goNamed(RoutesName.route);
                    },
                  ),
                  CustomListTile(
                    icon: Icons.account_balance_outlined,
                    title: "Organization",
                    color: Colors.white,
                    location: '/organization',
                    isCollapsed: false,
                    onTap: () {
                      provider.setSelectedItem("Organization");
                      if (Scaffold.maybeOf(context)?.hasDrawer ?? false) {
                        Navigator.of(context).pop();
                      }
                      context.goNamed(RoutesName.organization);
                    },
                  ),
                  CustomListTile(
                    icon: Icons.group_rounded,
                    title: "Users",
                    location: '/contacts',
                    color: Colors.white,
                    isCollapsed: false,
                    onTap: () {
                      provider.setSelectedItem("Users");
                      if (Scaffold.maybeOf(context)?.hasDrawer ?? false) {
                        Navigator.of(context).pop();
                      }
                      context.goNamed(RoutesName.users);
                    },
                  ),
                  CustomListTile(
                    icon: Icons.menu_book_rounded,
                    title: "Contacts",
                    location: '/contacts',
                    color: Colors.white,
                    isCollapsed: false,
                    onTap: () {
                      provider.setSelectedItem("Contacts");
                      if (Scaffold.maybeOf(context)?.hasDrawer ?? false) {
                        Navigator.of(context).pop();
                      }
                      context.goNamed(RoutesName.contacts);
                    },
                  ),
                  CustomListTile(
                    icon: Icons.manage_accounts_outlined,
                    title: "My Profile",
                    location: '/profile',
                    color: Colors.white,
                    isCollapsed: false,
                    onTap: () {
                      provider.setSelectedItem("My Profile");
                      if (Scaffold.maybeOf(context)?.hasDrawer ?? false) {
                        Navigator.of(context).pop();
                      }
                      context.goNamed(RoutesName.profile);
                    },
                  ),
                ],
              );
            }
          },
        ),
        SizedBox(height: 10.spMin),
        const Divider(
          color: Colors.grey,
          thickness: 0.3,
        ),
        SizedBox(height: 10.spMin),
        Builder(builder: (context) {
          if (provider.isAppbarCollapsed) {
            return CustomListTile(
              location: '',
              icon: Icons.logout,
              title: "Logout",
              color: Colors.white,
              onTap: () async {
                _signOut();
                context.pushReplacementNamed(RoutesName.loginScreen);
              },
              isCollapsed: true,
            );
          } else {
            return CustomListTile(
              icon: Icons.logout,
              location: '',
              title: "Logout",
              color: Colors.white,
              isCollapsed: false,
              onTap: () async {
                _signOut();
                context.pushReplacementNamed(RoutesName.loginScreen);
              },
            );
          }
        }),
      ],
    );
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final bool isCollapsed;
  final VoidCallback onTap;
  final String location;

  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
    required this.isCollapsed,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<ResponsiveAppProvider>();
    final GoRouter route = GoRouter.of(context);
    final String routeLocation = route.location;
    return Material(
      type: MaterialType.transparency,
      child: ListTile(
        leading: Icon(icon, color: color),
        title: (isCollapsed == false)
            ? Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: color,
                  fontWeight: provider.selectedNavItem == title
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              )
            : const SizedBox.shrink(),
        onTap: onTap,
        selected: routeLocation == location ? true : false,
        //provider.selectedNavItem == title,
        selectedTileColor: const Color(0xff39444F),
        splashColor: Colors.transparent,
      ),
    );
  }
}
