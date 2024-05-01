import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ConnectivityDemo(),
    );
  }
}

class ConnectivityDemo extends StatefulWidget {
  const ConnectivityDemo({super.key});

  @override
  State<ConnectivityDemo> createState() => _ConnectivityDemoState();
}

class _ConnectivityDemoState extends State<ConnectivityDemo> {
  ConnectivityResult connectivityResult = ConnectivityResult.none;

  @override
  void initState() {
    super.initState();

    // Initialize connectivity status
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        connectivityResult = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade200,
        title: const Text('Connectivity Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Connection Status:',
            ),
            Text(
              '$connectivityResult',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: connectivityResult == ConnectivityResult.none ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
