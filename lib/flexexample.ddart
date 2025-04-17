import 'package:flutter/material.dart';

class SecondLayout extends StatelessWidget {
  const SecondLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card View Different Size Demo",style: TextStyle(color: Colors.black),),
      ),
      body: Row(
        children: [
          Expanded(
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                        color: Colors.grey,
                      )
                  ),
                  Expanded(
                      child: Container(
                        color: Colors.orange,
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
              child: Column(
                children: [
                  Expanded(
                      flex:2,
                      child: Container(
                        color: Colors.red,
                      )
                  ),
                  Expanded(
                    flex: 2,
                      child: Container(
                        color: Colors.green,
                      )
                  ),
                  Expanded(
                      child: Container(
                        color: Colors.white54,
                      )
                  )
                ],
              )
          ),
          Expanded(
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                        color: Colors.redAccent,
                      )
                  ),
                  Expanded(
                    flex: 3,
                      child: Container(
                        color: Colors.yellowAccent,
                      )
                  ),
                  Expanded(
                    flex: 2,
                      child: Container(
                        color: Colors.purpleAccent,
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
