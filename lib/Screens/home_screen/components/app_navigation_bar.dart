import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:responsive_web_app/provider/responsive_app_provider.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

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
                    onTap: () {
                      provider.setSelectedItem("Dashboard");
                    },
                    isCollapsed: true,
                  ),
                  CustomListTile(
                    icon: Icons.content_paste,
                    title: "Route",
                    color: Colors.white,
                    onTap: () {
                      provider.setSelectedItem("Route");
                    },
                    isCollapsed: true,
                  ),
                  CustomListTile(
                    icon: Icons.account_balance_outlined,
                    title: "Organization",
                    color: Colors.white,
                    onTap: () {
                      provider.setSelectedItem("Organization");
                    },
                    isCollapsed: true,
                  ),
                  CustomListTile(
                    icon: Icons.group_rounded,
                    title: "Users",
                    color: Colors.white,
                    onTap: () {
                      provider.setSelectedItem("Users");
                    },
                    isCollapsed: true,
                  ),
                  CustomListTile(
                    icon: Icons.menu_book_rounded,
                    title: "Contacts",
                    color: Colors.white,
                    isCollapsed: true,
                    onTap: () {
                      provider.setSelectedItem("Contacts");
                    },
                  ),
                  CustomListTile(
                    icon: Icons.manage_accounts_outlined,
                    title: "My Profile",
                    color: Colors.white,
                    onTap: () {
                      provider.setSelectedItem("My Profile");
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
                    isCollapsed: false,
                    onTap: () {
                      provider.setSelectedItem("Dashboard");
                      if (Scaffold.maybeOf(context)?.hasDrawer ?? false) {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  CustomListTile(
                    icon: Icons.content_paste,
                    title: "Route",
                    color: Colors.white,
                    isCollapsed: false,
                    onTap: () {
                      provider.setSelectedItem("Route");
                      if (Scaffold.maybeOf(context)?.hasDrawer ?? false) {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  CustomListTile(
                    icon: Icons.account_balance_outlined,
                    title: "Organization",
                    color: Colors.white,
                    isCollapsed: false,
                    onTap: () {
                      provider.setSelectedItem("Organization");
                      if (Scaffold.maybeOf(context)?.hasDrawer ?? false) {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  CustomListTile(
                    icon: Icons.group_rounded,
                    title: "Users",
                    color: Colors.white,
                    isCollapsed: false,
                    onTap: () {
                      provider.setSelectedItem("Users");
                      if (Scaffold.maybeOf(context)?.hasDrawer ?? false) {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  CustomListTile(
                    icon: Icons.menu_book_rounded,
                    title: "Contacts",
                    color: Colors.white,
                    isCollapsed: false,
                    onTap: () {
                      provider.setSelectedItem("Contacts");
                      if (Scaffold.maybeOf(context)?.hasDrawer ?? false) {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  CustomListTile(
                    icon: Icons.manage_accounts_outlined,
                    title: "My Profile",
                    color: Colors.white,
                    isCollapsed: false,
                    onTap: () {
                      provider.setSelectedItem("My Profile");
                      if (Scaffold.maybeOf(context)?.hasDrawer ?? false) {
                        Navigator.of(context).pop();
                      }
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
              icon: Icons.logout,
              title: "Logout",
              color: Colors.white,
              onTap: () {},
              isCollapsed: true,
            );
          } else {
            return CustomListTile(
              icon: Icons.logout,
              title: "Logout",
              color: Colors.white,
              isCollapsed: false,
              onTap: () {},
            );
          }
        }),
      ],
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final bool isCollapsed;
  final VoidCallback onTap;

  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
    required this.isCollapsed,
  });

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<ResponsiveAppProvider>();
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
        selected: provider.selectedNavItem == title,
        selectedTileColor: const Color(0xff39444F),
        splashColor: Colors.transparent,
      ),
    );
  }
}
