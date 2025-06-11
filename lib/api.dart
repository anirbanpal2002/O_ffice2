import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: PostDataPage());
  }
}

class PostDataPage extends StatefulWidget {
  const PostDataPage({super.key});

  @override
  State<PostDataPage> createState() => _PostDataPageState();
}

class _PostDataPageState extends State<PostDataPage> {
  final TextEditingController nameController = TextEditingController();
  String responseMessage = '';

  Future<void> sendData(String name) async {
    final url = Uri.parse('https:///comments');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name}),
    );

    if (response.statusCode == 200) {
      setState(() {
        responseMessage = 'Success: ${response.body}';
      });
    } else {
      setState(() {
        responseMessage = 'Error: ${response.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('POST to Localhost')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Enter name'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => sendData(nameController.text),
              child: const Text('Send'),
            ),
            const SizedBox(height: 24),
            Text(responseMessage),
          ],
        ),
      ),
    );
  }
}
