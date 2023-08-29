// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InBox extends StatefulWidget {
  const InBox({super.key});

  @override
  State<InBox> createState() => _InBoxState();
}

class _InBoxState extends State<InBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chats")),
      body: ListView.separated(
        separatorBuilder: (context, index) {
         return Divider(color: Colors.black26,thickness: 2,);
        },
          itemCount: 3,
          itemBuilder: ((context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 25,
              ),
              title: Text('user name'),
              subtitle: Text('user message'),
              trailing: Text('today'),
            );
          })),
    );
  }
}
