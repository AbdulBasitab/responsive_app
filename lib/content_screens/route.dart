import 'package:flutter/material.dart';

import '../widgets/custom_scaffold_page.dart';

class Route extends StatelessWidget {
  const Route({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldPage(appBarTitle: "Route", body: Container());
  }
}
