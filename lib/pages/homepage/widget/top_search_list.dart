import 'package:flutter/material.dart';

import 'home_widgets.dart';

class TopSearch extends StatelessWidget {
  const TopSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return TopSearchItem(
          name: products[index]['name'].toString(),
          onTap: () {},
        );
      },
    );
  }
}
