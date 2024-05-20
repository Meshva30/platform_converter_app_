import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Ios/profile/profile.dart';
import '../settings.dart';

final TextEditingController name = TextEditingController();
final TextEditingController bio = TextEditingController();

Widget profile_container() {
  return Column(
    children: [
      InkWell(
        onTap: () {
          getImage();
        },
        child: CircleAvatar(
          radius: 80,
          backgroundImage: image != null ? FileImage(image!) : null,
          child: image == null
              ? Icon(
            Icons.camera_alt,
            size: 50,
            color: Colors.grey[800],
          )
              : null,
        ),
      ),
      TextField(
        controller: name,
        decoration: InputDecoration(
          hintText: 'Enter your name...',
        ),
      ),
      TextField(
        controller: bio,
        decoration: InputDecoration(
          hintText: 'Enter your Bio...',
        ),
      ),
      Row(
        children: [
          TextButton(
            onPressed: () {},
            child: Text('SAVE'),
          ),
          TextButton(onPressed: () {}, child: Text('CLEAR'))
        ],
      )
    ],
  );
}

