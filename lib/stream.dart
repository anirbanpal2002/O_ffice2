import 'dart:async';
import 'package:flutter/material.dart';

class CounterStreamPage extends StatefulWidget {
  @override
  _CounterStreamPageState createState() => _CounterStreamPageState();
}

class _CounterStreamPageState extends State<CounterStreamPage> {
  final StreamController<int> _counterController = StreamController<int>();
  int _counter = 0;

  void _incrementCounter() {
    _counter++;
    _counterController.sink.add(_counter); // Add data to the stream
  }

  @override
  void dispose() {
    _counterController.close(); // Always close the stream controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StreamController Example')),
      body: Center(
        child: StreamBuilder<int>(
          stream: _counterController.stream,
          initialData: _counter,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                'Counter: ${snapshot.data}',
                style: TextStyle(fontSize: 24),
              );
            } else {
              return Text('No data');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
