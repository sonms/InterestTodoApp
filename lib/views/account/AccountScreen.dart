
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

class MyState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Account Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to Account Screen", style: TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: () {},
              child: Text("Edit Profile"),
            ),
          ],
        ),
      ),
    );
  }
}