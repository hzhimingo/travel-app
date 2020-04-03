import 'package:flutter/material.dart';

class SingleCityItem extends StatelessWidget {
  final String city;
  const SingleCityItem({Key key, @required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 5,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
      child: Text(
        city,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }
}