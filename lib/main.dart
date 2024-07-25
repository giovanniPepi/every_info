import "package:device_info_plus/src/model/android_device_info.dart";
import "package:every_info/info/utils.dart";
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: "Every Info",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _androidInfo = "";

  Future<void> _getInfo() async {
    final AndroidDeviceInfo androidDeviceInfo = await Utils().getAndroidInfo();
    final String info = androidDeviceInfo.toString();

    setState(() {
      _androidInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
        title: Center(
            child: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                // style: Theme.of(context).textTheme.headlineMedium,
                child: Text(
                  _androidInfo,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textScaler: const TextScaler.linear(1.5),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getInfo,
        tooltip: "Get Info",
        child: const Icon(Icons.add),
      ),
    );
  }
}
