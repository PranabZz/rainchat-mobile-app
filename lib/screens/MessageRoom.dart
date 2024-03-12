import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MessageRoom extends StatefulWidget {
  const MessageRoom({required this.username, Key? key}) : super(key: key);

  final String username;

  @override
  State<MessageRoom> createState() => _MessageRoomState();
}

class _MessageRoomState extends State<MessageRoom> {
  late IO.Socket socket;

  late List<dynamic> messageClient = [];
  late List<dynamic> messageServer = [];

  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    initSocket();
    super.initState();
  }

  initSocket() {
    socket = IO.io('http://192.168.1.90:3000', <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((_) {
      print('Connection established');
    });
    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err));

    socket.emit('message', 'Hello form Flutter');

    socket.on('server_message', (data) {
      print('Received message: $data');
    });
  }

  void sendMessage(message) {
    print(message);

    socket.emit('client_message', message);

    messageController.clear();
    setState(() {
      messageClient.add(message);
      socket.on('server_message', (data) {
        messageServer.add(data);
      });
    });
  }

  late var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.username,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.info))],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10.0),
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.emoji_emotions,
                            color: Colors.blue,
                          ),
                          onPressed: () {},
                        ),
                        Expanded(
                          child: Container(
                            width: 170,
                            // height: 1000,
                            constraints: const BoxConstraints(maxWidth: 165),
                            child: Expanded(
                              child: TextFormField(
                                focusNode: focusNode,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.multiline,
                                controller: messageController,
                                maxLines: 5,
                                minLines: 1,
                                decoration: const InputDecoration(
                                  hintText: "Type Something...",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.attach_file,
                              color: Colors.blueAccent),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    onLongPress: () {},
                    onTap: () {
                      sendMessage(messageController.text);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.end, // Align all content vertically
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Left-aligned column for sent messages
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Align entire row to right
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var msg in messageServer ) // Iterate through each message in the list
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 20.0, bottom: 8),
                            child: Container(
                              width: 200, // Adjust width as needed
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors
                                    .blue, // Use a different color for received messages
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                msg ?? '', // Display the current message
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        // Add more sent messages here
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/avatar.png'),
                          radius: 15,
                          backgroundColor: Colors.transparent,
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(
                  height: 30,
                ),
                // Right-aligned column for received messages (optional)

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end, // Align entire row to right
                  crossAxisAlignment: CrossAxisAlignment
                      .end, // Align content within row to bottom
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        for (var msg
                            in messageClient) // Iterate through each message in the list
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 20.0, bottom: 8),
                            child: Container(
                              width: 200, // Adjust width as needed
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors
                                    .blue, // Use a different color for received messages
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                msg, // Display the current message
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        // Add more received messages here
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/avatar.png'),
                          radius: 15,
                          backgroundColor: Colors.transparent,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
