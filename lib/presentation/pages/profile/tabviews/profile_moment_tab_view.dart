import 'package:flutter/material.dart';

class ProfileMomentTabView extends StatelessWidget {
  const ProfileMomentTabView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) => Container(
          width: MediaQuery.of(context).size.width,
          height: 200.0,
          color: Colors.yellow,
          margin: EdgeInsets.only(bottom: 20.0),
        ),
      ),
    );
  }
}
