import 'package:flutter/material.dart';

class FirstLayout extends StatelessWidget {
  const FirstLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card View Same Size Demo",style: TextStyle(color: Colors.black),),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        color: Colors.red,
                      )
                  ),
                  Expanded(
                      child: Container(
                        color: Colors.green,
                      )
                  ),
                  Expanded(
                      child: Container(
                        color: Colors.blue,
                      )
                  )
                ],
              )
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        color: Colors.brown,
                      )
                  ),
                  Expanded(
                      child: Container(
                        color: Colors.blueGrey,
                      )
                  ),
                  Expanded(
                      child: Container(
                        color: Colors.purple,
                      )
                  )
                ],
              )
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        color: Colors.black,
                      )
                  ),
                  Expanded(
                      child: Container(
                        color: Colors.deepOrange,
                      )
                  ),
                  Expanded(
                      child: Container(
                        color: Colors.orange,
                      )
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
}
