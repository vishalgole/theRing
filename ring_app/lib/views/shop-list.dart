import 'package:flutter/material.dart';

class ShopList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                ListTile(
                  leading: Image.asset("assets/images/image-not-found.png"),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Cycle Lille"),
                      Row(
                        children: [
                          Text("a 41m"),
                          Icon(Icons.star),
                          Text("5.0 (2)"),
                        ],
                      ),
                      Text("Loisirs"),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
