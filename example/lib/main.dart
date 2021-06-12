import 'package:base_flutter_app/ui/platform_widgets/platform_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
          primaryColor: Colors.blue,
        ),
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: List.generate(
                5,
                (index) => PlatformButton(
                      onPressed: () {},
                      text: 'Button',
                      isLoading: true,
                    )),
          ),
        ),
      ),
    );
  }
}
