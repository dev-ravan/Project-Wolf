// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:ravan/Api_Service/get_api.dart';
import 'package:ravan/Reusable_Widgets/Widgets.dart';
import 'package:ravan/Reusable_Widgets/colors.dart';
import 'package:provider/provider.dart';
import 'package:ravan/Screens/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final getApi = Provider.of<GetApi>(context, listen: false);
    getApi.getUserDetails();
    super.initState();
  }

  final reuse = ReusableWidgets();
  @override
  Widget build(BuildContext context) {
    final getApi = Provider.of<GetApi>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: reuse.Logo()),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Image(
                      image: AssetImage("assets/Userlist.png"),
                      height: 600,
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(
                        left: 100, right: 100, bottom: 50, top: 40),
                    child: Column(
                      children: [
                        Consumer<GetApi>(
                          builder: (context, snapshot, child) =>
                              ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.UserDetails.length,
                            itemBuilder: (context, i) {
                              return Column(
                                children: [
                                  InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    hoverColor: pinkColor,
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => UserDetails(
                                                    Id: snapshot
                                                        .UserDetails[i].id,
                                                  )));
                                    },
                                    child: reuse.UserContainer(
                                        name:
                                            "${snapshot.UserDetails[i].firstName} ${snapshot.UserDetails[i].lastName}",
                                        email: snapshot.UserDetails[i].email,
                                        profile:
                                            snapshot.UserDetails[i].avatar),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
