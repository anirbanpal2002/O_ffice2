import 'dart:async';

import 'package:flutter/material.dart';
import 'broadcast_service.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  String _latestMessage = "Waiting for broadcast...";
  late final StreamSubscription<String> _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = BroadcastService().stream.listen((message) {
      setState(() {
        _latestMessage = message;
      });
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Two')),
      body: Center(
        child: Text(
          _latestMessage,
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
