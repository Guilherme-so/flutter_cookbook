import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cookbook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfileScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from the Future'),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(
              child: const Text('GO!'),
              onPressed: () async {
                result = '';
                setState(() {
                  result = result;
                });
                try {
                  final response = await getData();
                  setState(() {
                    result = response.toString();
                  });
                } catch (e) {
                  const error = 'an error ocurred';
                  setState(() {
                    result = error;
                  });
                }
              },
            ),
            const Spacer(),
            Text(result.toString()),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

Future getData() async {
  final dio = Dio();
  final response =
      await dio.get('https://official-joke-api.appspot.com/random_joke');
  return response;
}
