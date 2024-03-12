import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

import 'package:rainchat/screens/MessageRoom.dart';


class MessageScreen extends StatefulWidget {
  const MessageScreen({required this.username, Key? key});

  final String username;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
          backgroundColor: Colors.black,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.grey,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(50), // Adjust the value as needed
            ),
            child: const Icon(
              Icons.message_outlined,
              color: Colors.white,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {},
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(Icons.groups),
                  onPressed: () {
                    // Add functionality for groups button
                  },
                ),
                label: 'Groups',
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {
                    // Add functionality for profile button
                  },
                ),
                label: 'Profile',
              ),
            ],
          ),
          appBar: AppBar(
            toolbarHeight: 80,
            title: const Text(
              "RainChat",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
            iconTheme: const IconThemeData(color: Colors.white),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            ],
          ),
          drawer: Drawer(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MessageRoom(username: widget.username)),
                        );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left:20.0,right: 20.0),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          // color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Row(
                        children: [
                          // User DP
                          SizedBox(
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/avatar.png'),
                              radius: 40,
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          // Message Box
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Jhons Jones',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Message We are not looking ...',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20.0),
                                      child: Text(
                                        '11:20',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 8),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Text sent time
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20.0,right: 20.0),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        // color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Row(
                      children: [
                        // User DP
                        SizedBox(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/avatar.png'),
                            radius: 40,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        // Message Box
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jhons Jones',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Message We are not looking ...',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      '11:20',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 8),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),    // Text sent time
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20.0,right: 20.0),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        // color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Row(
                      children: [
                        // User DP
                        SizedBox(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/avatar.png'),
                            radius: 40,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        // Message Box
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jhons Jones',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Message We are not looking ...',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      '11:20',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 8),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),    // Text sent time
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20.0,right: 20.0),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        // color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Row(
                      children: [
                        // User DP
                        SizedBox(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/avatar.png'),
                            radius: 40,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        // Message Box
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jhons Jones',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Message We are not looking ...',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      '11:20',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 8),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),    // Text sent time
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20.0,right: 20.0),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        // color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Row(
                      children: [
                        // User DP
                        SizedBox(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/avatar.png'),
                            radius: 40,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        // Message Box
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jhons Jones',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Message We are not looking ...',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      '11:20',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 8),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),    // Text sent time
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
