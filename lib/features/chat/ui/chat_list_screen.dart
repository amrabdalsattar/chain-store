// // chat_screen.dart
// import 'package:flutter/material.dart';
// import 'package:zego_zim/zego_zim.dart';

// class ChatListScreen extends StatefulWidget {
//   final String currentUserId;
//   final String currentUserName;

//   ChatListScreen({required this.currentUserId, required this.currentUserName});

//   @override
//   _ChatListScreenState createState() => _ChatListScreenState();
// }

// class _ChatListScreenState extends State<ChatListScreen> {
//   final TextEditingController _targetUserController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat with ${widget.currentUserName}'),
//         backgroundColor: Colors.blue[600],
//         actions: [IconButton(icon: Icon(Icons.logout), onPressed: _logout)],
//       ),
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Start a New Chat',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 controller: _targetUserController,
//                 decoration: InputDecoration(
//                   labelText: 'Enter User ID to chat with',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.person_add),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _startChat,
//                 child: Text('Start Chat'),
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//                   textStyle: TextStyle(fontSize: 16),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
