// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class Home extends StatefulWidget {
//   const Home({super.key});
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// // Function to fetch users from API
// Future<List<String>> fetchUsers() async {
//   final response = await http.get(
//     Uri.parse('https://jsonplaceholder.typicode.com/comments'),
//   );
//
//   if (response.statusCode == 200) {
//     final List<dynamic> data = jsonDecode(response.body);
//     return data.map<String>((user) {
//       final name = user['name'];
//       final email = user['email'];
//       return 'Name: $name, Email: $email';
//     }).toList();
//   } else {
//     throw Exception('Failed to load users');
//   }
// }
//
// class _HomeState extends State<Home> {
//   late Future<List<String>> futureUsers;
//   @override
//   void initState() {
//     super.initState();
//     futureUsers = fetchUsers(); // Calling API
//   }
//
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(title: Text("Users")),
//         body: FutureBuilder<List<String>>(
//           future: futureUsers,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text("Error: ${snapshot.error}"));
//             } else {
//               final users = snapshot.data!;
//               return ListView.builder(
//                 itemCount: users.length,
//                 itemBuilder:
//                     (context, index) => ListTile(title: Text(users[index])),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:skeletonizer/skeletonizer.dart';
//
// class Home extends StatefulWidget {
//   const Home({super.key});
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// // ✅ Make sure this returns Future<List<Map<String, dynamic>>>
// Future<List<Map<String, dynamic>>> fetchUsers() async {
//   final response = await http.get(
//     Uri.parse('https://jsonplaceholder.typicode.com/comments'),
//   );
//
//   if (response.statusCode == 200) {
//     final List<dynamic> data = jsonDecode(response.body);
//     return data.cast<Map<String, dynamic>>();
//   } else {
//     throw Exception('Failed to load comments');
//   }
// }
//
// class _HomeState extends State<Home> {
//   late Future<List<Map<String, dynamic>>> futureUsers;
//   bool _enabled = false;
//
//   @override
//   void initState() {
//     super.initState();
//     futureUsers = fetchUsers(); // ✅ This must return the correct type
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(title: Text("Comments")),
//         body: FutureBuilder<List<Map<String, dynamic>>>(
//           future: futureUsers,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text("Error: ${snapshot.error}"));
//             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return Center(child: Text("No data found"));
//             } else {
//               final comments = snapshot.data!;
//               return Skeletonizer(
//                 enabled: _enabled,
//                 child: ListView.builder(
//                   itemCount: comments.length,
//                   itemBuilder: (context, index) {
//                     final comment = comments[index];
//                     return Card(
//                       margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                       elevation: 4,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Name: ${comment['name']}",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             SizedBox(height: 6),
//                             Text(
//                               "Email: ${comment['email']}",
//                               style: TextStyle(color: Colors.grey[700]),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               comment['body'],
//                               style: TextStyle(fontSize: 14),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class Home extends StatefulWidget {
//   const Home({super.key});
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   final List<Map<String, dynamic>> _allComments = [];
//   final List<Map<String, dynamic>> _visibleComments = [];
//   final ScrollController _scrollController = ScrollController();
//   bool _isLoading = false;
//   int _batchSize = 5;
//   int _currentIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchComments();
//     _scrollController.addListener(_scrollListener);
//   }
//
//   Future<void> _fetchComments() async {
//     setState(() => _isLoading = true);
//     try {
//       final response = await http.get(
//         Uri.parse('https://jsonplaceholder.typicode.com/comments'),
//       );
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body).cast<Map<String, dynamic>>();
//         _allComments.addAll(data);
//         _loadMoreItems();
//       } else {
//         throw Exception('Failed to load comments');
//       }
//     } catch (e) {
//       print("Error: $e");
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }
//
//   void _loadMoreItems() {
//     final nextIndex = _currentIndex + _batchSize;
//     if (_currentIndex < _allComments.length) {
//       final newItems = _allComments.sublist(
//         _currentIndex,
//         nextIndex > _allComments.length ? _allComments.length : nextIndex,
//       );
//       setState(() {
//         _visibleComments.addAll(newItems);
//         _currentIndex = nextIndex;
//       });
//     }
//   }
//
//   void _scrollListener() {
//     if (_scrollController.position.pixels >=
//             _scrollController.position.maxScrollExtent - 200 &&
//         !_isLoading) {
//       _loadMoreItems();
//     }
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(title: const Text("Comments")),
//         body:
//             _isLoading && _visibleComments.isEmpty
//                 ? const Center(child: CircularProgressIndicator())
//                 : ListView.builder(
//                   controller: _scrollController,
//                   itemCount: _visibleComments.length + 1,
//                   itemBuilder: (context, index) {
//                     if (index == _visibleComments.length) {
//                       return _currentIndex < _allComments.length
//                           ? const Padding(
//                             padding: EdgeInsets.symmetric(vertical: 16.0),
//                             child: Center(child: CircularProgressIndicator()),
//                           )
//                           : const SizedBox(); // No more items
//                     }
//
//                     final comment = _visibleComments[index];
//                     return Card(
//                       margin: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 8,
//                       ),
//                       elevation: 4,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Name: ${comment['name']}",
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             const SizedBox(height: 6),
//                             Text(
//                               "Email: ${comment['email']}",
//                               style: TextStyle(color: Colors.grey[700]),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               comment['body'],
//                               style: const TextStyle(fontSize: 14),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart'; // Add shimmer package

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// Function to fetch users from API
Future<List<String>> fetchUsers() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/comments'),
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map<String>((user) {
      final name = user['name'];
      final email = user['email'];
      return 'Name: $name, Email: $email';
    }).toList();
  } else {
    throw Exception('Failed to load users');
  }
}

class _HomeState extends State<Home> {
  late Future<List<String>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers(); // Calling API
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Users")),
        body: FutureBuilder<List<String>>(
          future: futureUsers,
          builder: (context, snapshot) {
            // Skeleton Loader while data is being fetched
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ListView.builder(
                itemCount: 10, // Show skeletons for 10 items
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Card(
                        margin: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(height: 20, color: Colors.white),
                              SizedBox(height: 8),
                              Container(height: 20, color: Colors.white),
                              SizedBox(height: 8),
                              Container(height: 60, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            // Error Handling
            else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
            // When data is fetched
            else {
              final users = snapshot.data!;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              users[index].split(",")[0], // Show name
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              users[index].split(",")[1], // Show email
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
