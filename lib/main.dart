import 'package:flutter/material.dart';
import 'package:hello_world/pages/TestPage1.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _type = "偶数";

  void _incrementCounter() {
    setState(() {
      if (_counter % 2 == 0) {
        _type = '偶数';
      } else {
        _type = '奇数';
      }
      _counter++;
    });
  }

  void handleMovePage1(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const TestPage1();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [Icon(Icons.create), Text("初めてのタイトル")],
        ),
      ),
      drawer: const Drawer(child: Center(child: Text('Drawer'))),
      body: Center(
        child: (
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$_counter', style: const TextStyle(fontSize: 20.0, fontFamily: 'roboto', color: Colors.amber)),
              Text(
                _type,
                style: const TextStyle(fontSize: 20.0, color: Colors.amber, fontFamily: 'roboto')),
              IconButton(
                icon: const Icon(Icons.accessibility_sharp),
                onPressed: () async {
                  String url = Uri.encodeFull('https://google.com');
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
              }),
              TextButton(onPressed: ()=>  handleMovePage1(context), child: const Text('ページ1に移動', style: TextStyle(fontSize: 20.0, fontFamily: 'roboto'),))
            ]
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.timer),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
