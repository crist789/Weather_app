import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
              Container(
                height: 40,
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("juan"),
                      Text("juan"),
                    ]),
              ),
              const Row(
                children: [
                  Text("Daily statics"),
                ],
              ),
              const Column(
                children: [Placeholder()],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("forecast"),
                ],
              ),
              Expanded(
                child: ListView(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.abc),
                      title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [Text("clima"), Text("temperatura")]),
                      trailing: Text("hora"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
