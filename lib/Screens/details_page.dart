// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:ravan/Api_Service/get_api.dart';
import 'package:ravan/Reusable_Widgets/Widgets.dart';
import 'package:provider/provider.dart';

class UserDetails extends StatefulWidget {
  int Id;
  UserDetails({super.key, required this.Id});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  String? name;
  String? mailId;
  String? url;

  @override
  void initState() {
    super.initState();
    // final getApi = Provider.of<GetApi>(context, listen: false);
  }

  final reuse = ReusableWidgets();
  @override
  Widget build(BuildContext context) {
    final getApi = Provider.of<GetApi>(context);
    url == null
        ? getApi.SingleUserDetails(widget.Id).then((value) {
            name = "${value!.data.firstName} ${value.data.lastName}";
            mailId = value.data.email;
            url = value.data.avatar;

            setState(() {});
          })
        : "";
    return Scaffold(
      body: Container(
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
                  padding: const EdgeInsets.only(top: 20),
                  child: Image(
                    image: AssetImage("assets/person.png"),
                    height: 670,
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(
                    left: 60,
                    right: 200,
                    bottom: 70,
                  ),
                  child: Column(
                    children: [
                      reuse.DetailContainer(
                          mailId: mailId ?? mailId.toString(),
                          name: name ?? name.toString(),
                          url: url ?? url.toString())
                    ],
                  ),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
