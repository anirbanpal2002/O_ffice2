import 'package:flutter/material.dart';
import 'broadcast_service.dart';
import 'page_two.dart';

class PageOne extends StatelessWidget {
  final BroadcastService _broadcaster = BroadcastService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page One')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Send Message'),
              onPressed: () {
                final message = "Hello from Page One at ${DateTime.now()}";
                _broadcaster.send(message);
              },
            ),
            ElevatedButton(
              child: Text('Go to Page Two'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageTwo()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
