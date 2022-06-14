import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Text("sdfgs")

            //            Expanded(
            //               child: Form(
            //               child: Column(
            //                 children: [
            //                   //Text(items[0]["FormName"]),
            //                   //Text(items[0]["List"][0]["color"])
            //                   Padding(
            //                     padding: const EdgeInsets.symmetric(
            //                         horizontal: 8, vertical: 16),
            //                     child: TextField(
            //                       decoration: InputDecoration(
            //                         //labelText: items[1]["name"],
            //                         border: const OutlineInputBorder(),
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             )
            //               /*ListView.builder(
            //                 itemCount: items.length,
            //                 itemBuilder: (context, index) {
            //                   return Card(
            //                     margin: const EdgeInsets.all(10),
            //                     child: ListTile(
            //                       leading: Text(items[index]["id"]),
            //                       title: Text(items[index]["name"]),
            //                       subtitle: Text(items[index]["description"]),
            //                     ),
            //                   );
            //                 },
            //               ),*/

            //               ),
            //            Container()
          ],
        ),
      ),
    );
  }
}
