import 'package:flutter/material.dart';
import 'TestPage2.dart';

class TestPage1 extends StatelessWidget {
  const TestPage1({Key? key}) : super(key: key);

  void handleMovePage(context, page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return page;
    }));
  }

  void handleBackPage(context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Test1"),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton(
              onPressed: () => handleMovePage(context, TestPage2()),
              child: const Text("進む", style: TextStyle(fontSize: 20))),
          TextButton(
              onPressed: () => handleBackPage(context),
              child: const Text("戻る", style: TextStyle(fontSize: 20)))
        ])));
  }
}
