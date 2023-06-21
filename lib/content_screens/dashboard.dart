import 'package:flutter/material.dart';

import '../widgets/custom_scaffold_page.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldPage(appBarTitle: "Dashboard", body: Container());
  }
}
