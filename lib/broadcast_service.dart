import 'dart:async';

class BroadcastService {
  // Singleton pattern
  static final BroadcastService _instance = BroadcastService._internal();
  factory BroadcastService() => _instance;
  BroadcastService._internal();

  final StreamController<String> _controller =
      StreamController<String>.broadcast();

  Stream<String> get stream => _controller.stream;

  void send(String message) {
    _controller.add(message);
  }

  void dispose() {
    _controller.close();
  }
}
