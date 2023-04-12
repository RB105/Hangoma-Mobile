import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hangomamobile/provider/remote/chat_provider.dart';
import 'package:hangomamobile/view/screens/drawer_screen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controller
  ScrollController scrollController = ScrollController();
  bool isVisible = false;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels !=
          scrollController.position.maxScrollExtent) {
        setState(() {
          isVisible = true;
        });
      } else if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() {
          isVisible = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ChatProvider chatProvider = Provider.of<ChatProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => ChatProvider(),
      builder: (context, child) {
        return Scaffold(
          drawer: const MyDrawer(),
          appBar: AppBar(
            title: const Text("Hangoma"),
            actions: const [CircleAvatar()],
          ),
          body: StreamBuilder(
            stream: chatProvider.chatStream,
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                List<Map<String, dynamic>> data = [];
                snapshot.data!.docs.map((e) {
                  data.add(e.data() as Map<String, dynamic>);
                }).toList();
                if (data.isEmpty) {
                  return const Center(child: Text("No messages yet"));
                } else {
                  return Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.08),
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: data.length,
                          itemBuilder: (context, index) {   
                            if ( data[index]['token'] ==
                                      FirebaseAuth.instance.currentUser!.uid) {
                              return Row(
                              mainAxisAlignment: 
                                   MainAxisAlignment.end,
                              children: [
                                Text(
                                  "${data[index]['user'].toString()} : ",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Container(
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20))),
                                  child: Text(
                                    data[index]['message'].toString(),
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              ],
                            );
                            } else {
                              return Row(
                              mainAxisAlignment: 
                                   MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  child: Text(
                                    data[index]['message'].toString(),
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                                 Text(
                                  "${data[index]['user'].toString()} : ",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            );
                            }
                          },
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: size.height * 0.09,
                                right: size.width * 0.01),
                            child: Visibility(
                              visible: isVisible,
                              child: FloatingActionButton.small(
                                backgroundColor: Colors.blue,
                                onPressed: () {
                                  scrollController.animateTo(
                                      scrollController.position.maxScrollExtent,
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.bounceInOut);
                                },
                                child: const Icon(Icons.keyboard_arrow_down),
                              ),
                            ),
                          ))
                    ],
                  );
                }
              }
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            width: double.infinity,
            height: size.height * 0.08,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 10,
                      child: TextFormField(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                        controller: chatProvider.messageController,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            hintText: "Write a message",
                            border: InputBorder.none),
                      )),
                  Expanded(
                      flex: 2,
                      child: IconButton(
                        onPressed: () {
                          chatProvider.sendMessage();
                          chatProvider.messageController.clear();
                          scrollController.animateTo(
                              scrollController.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.bounceInOut);
                        },
                        icon: const Icon(Icons.send_rounded),
                        color: Colors.blue,
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
