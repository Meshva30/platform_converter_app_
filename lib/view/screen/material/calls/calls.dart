import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../provider/chatProvider.dart';
import '../../../../provider/switchProvider.dart';
import '../../../../utils/adaptive/Adaptive_CirculAvtar.dart';
import 'package:url_launcher/url_launcher.dart' as url;

class Call extends StatelessWidget {
  const Call({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAndroid =
        Provider.of<SwitchProvider>(context, listen: true).isActive;
    final providerTrue = Provider.of<ChatProvider>(context);

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: providerTrue.personData.length,
            itemBuilder: (context, index) {
              var person = providerTrue.personData[index];
              return ListTile(
                  leading: Adaptive_CircleAvatar(radius: 30),
                  title: Text(person.name ?? "No Name"),
                  subtitle: Text(person.chatConversation ?? "No Conversation"),
                  trailing: IconButton(
                    onPressed: () {
                      Uri uri = Uri.parse(
                          'tel: +91 ${providerTrue.personData[index].phoneNumber}');
                      url.launchUrl(uri);
                    },
                    icon: Icon(Icons.call),
                  ));
            },
          ),
        ),
      ],
    );
  }
}
