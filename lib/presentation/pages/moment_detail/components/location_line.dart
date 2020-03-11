import 'package:flutter/material.dart';

class LocationLine extends StatelessWidget {
  final String country;
  final String city;
  final String location;
  const LocationLine({
    Key key,
    this.country,
    this.city,
    this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0);
    List<Widget> children = [];
    if (location == null && city == null) {
      if (country != null) {
        children.add(_buildNormalTag(country));
      } else {
        padding = EdgeInsets.zero;
      }
    } else {
      if (city != null) {
        children.add(_buildNormalTag(city));
      }
      if (location != null) {
        children.add(_buildLocationName(location));
      }
    }
    return Padding(
      padding: padding,
      child: Row(
        children: children,
      ),
    );
  }

  _buildNormalTag(String name) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      padding: EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 3.0,
        bottom: 3.0,
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(246, 247, 249, 1.0),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 15.0,
          color: Color.fromRGBO(78, 151, 254, 1.0),
        ),
      ),
    );
  }

  _buildLocationName(String location) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      padding: EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 3.0,
        bottom: 3.0,
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(246, 247, 249, 1.0),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 2.0),
            child: Icon(
              Icons.location_on,
              color: Color.fromRGBO(78, 151, 254, 1.0),
              size: 18.0,
            ),
          ),
          Text(
            location,
            style: TextStyle(
              fontSize: 15.0,
              color: Color.fromRGBO(78, 151, 254, 1.0),
            ),
          ),
        ],
      ),
    );
  }
}
