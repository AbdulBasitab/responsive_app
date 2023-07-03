import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:responsive_web_app/widgets/custom_scaffold_widget.dart';
// import '../../Provider/responsive_app_provider.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    //context.read<ResponsiveAppProvider>().setSelectedItem('dashboard');
    return CustomScaffoldPage(appBarTitle: "Contacts", body: Container());
  }
}
