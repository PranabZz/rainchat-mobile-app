import 'dart:convert';
// import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rainchat/screens/MessageRoom.dart';
// import 'package:rainchat/screens/MessageRoom.dart';
import 'package:rainchat/screens/MessageScreen.dart';
import 'package:http/http.dart' as http;
// import 'package:rainchat/screens/MessageScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rainchat',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final username = TextEditingController();
  final password = TextEditingController();

  late bool is_logged ;

  final Uri url = Uri.parse("http://192.168.1.90:3000/api/user"); // Parse the string URL into a Uri object

  Future<void> sendPostRequest(String username, String password) async {
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": username,
          "password": password,
        }));

    if (response.statusCode == 201) {
      print('Created');
      setState(() {
        is_logged = true;
      });
    } else {
      print('Unsuccessful');
       setState(() {
        is_logged = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 100,
                  ),
                  const Text(
                    'Welcome to Rainchat',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: username,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                    labelText: 'Enter your username',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5),
                child: TextField(
                  controller: password,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    labelText: 'Enter your password',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 25),
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => MessageScreen(
                        //           username: username.text,
                        //           password: password.text)),
                        // );
                        sendPostRequest(username.text, password.text);
                        if (is_logged == true) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MessageScreen(username: username.text,)),
                          );
                        }

                        // FakeLogin();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              )
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

// class FakeLogin extends StatefulWidget {
//   final String? username;
//   final String? password;

//   const FakeLogin({this.username, this.password});

//   @override
//   _FakeLoginState createState() => _FakeLoginState();
// }

// class _FakeLoginState extends State<FakeLogin> {
  
//   final Uri url = Uri.parse("http://192.168.1.90:3000/api/user"); // Parse the string URL into a Uri object

//   Future<void> sendPostRequest() async {
//     var response = await http.post(url,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({
//           "username": "${widget.username}",
//           "password": "${widget.password}"
//         }));

//     if (response.statusCode == 201) {
//       print('Created');
//     } else {
//       print('Unsucess');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Fake Login'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Username: ${widget.username ?? ''}',
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               'Password: ${widget.password ?? ''}',
//               style: TextStyle(fontSize: 18),
//             ),
//             ElevatedButton(
//               onPressed: sendPostRequest,
//               child: Text('Send Post Request'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
