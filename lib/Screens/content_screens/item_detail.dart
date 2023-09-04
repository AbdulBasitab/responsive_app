import 'package:flutter/material.dart';
import 'package:responsive_web_app/Widgets/custom_scaffold_widget.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({super.key, required this.itemIndex});

  final int itemIndex;
  @override
  Widget build(BuildContext context) {
    return CustomScaffoldPage(
      appBarTitle: 'Item $itemIndex',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("This is Item $itemIndex"),
          )
        ],
      ),
    );
  }
}
