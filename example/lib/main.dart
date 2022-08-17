import 'package:flutter/material.dart';
import 'package:microphone_info/microphone_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _microphoneInfoPlugin = MicrophoneInfo();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            StreamBuilder<Microphone?>(
              builder: (context, data) {
                return Text("ID: ${data.data?.id} - ${data.data?.type}");
              },
              stream: _microphoneInfoPlugin.getDefaultMicrophone().asStream(),
            ),
            const Divider(),
            Expanded(
              child: StreamBuilder<List<Microphone>>(
                builder: (context, data) {
                  return ListView.builder(
                    itemCount: data.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                          "ID: ${data.data?[index].id} - ${data.data?[index].type}");
                    },
                  );
                },
                stream: _microphoneInfoPlugin.getMicrophones().asStream(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
