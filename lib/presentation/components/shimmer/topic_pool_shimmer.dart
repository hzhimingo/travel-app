import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TopicPoolShimmer extends StatelessWidget {
  const TopicPoolShimmer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: false,
      baseColor: Colors.grey[200],
      highlightColor: Colors.grey[100],
      child: ListView.builder(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        itemCount: 4,
        itemBuilder: (context, index) => SizedBox(
          width: double.infinity,
          height: ((MediaQuery.of(context).size.width - 50.0) / 3) + 105.0,
          child: Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 30.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(right: 10.0),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(right: 10.0),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: (MediaQuery.of(context).size.width - 50.0) / 3,
                      height: ((MediaQuery.of(context).size.width - 50.0) / 3) +
                          60.0,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width:
                                (MediaQuery.of(context).size.width - 50.0) / 3,
                            height:
                                (MediaQuery.of(context).size.width - 50.0) / 3,
                            color: Colors.white,
                          ),
                          SizedBox(height: 5.0),
                          Column(
                            children: <Widget>[
                              Container(
                                width: (MediaQuery.of(context).size.width - 50.0) / 3,
                                height: 20.0,
                                color: Colors.white,
                              ),
                              SizedBox(height: 5.0),
                              Container(
                                width: (MediaQuery.of(context).size.width - 50.0) / 3,
                                height: 20.0,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width - 50.0) / 3,
                      height: ((MediaQuery.of(context).size.width - 50.0) / 3) +
                          60.0,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width:
                                (MediaQuery.of(context).size.width - 50.0) / 3,
                            height:
                                (MediaQuery.of(context).size.width - 50.0) / 3,
                            color: Colors.white,
                          ),
                          SizedBox(height: 5.0),
                          Column(
                            children: <Widget>[
                              Container(
                                width: (MediaQuery.of(context).size.width - 50.0) / 3,
                                height: 20.0,
                                color: Colors.white,
                              ),
                              SizedBox(height: 5.0),
                              Container(
                                width: (MediaQuery.of(context).size.width - 50.0) / 3,
                                height: 20.0,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width - 50.0) / 3,
                      height: ((MediaQuery.of(context).size.width - 50.0) / 3) +
                          60.0,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width:
                                (MediaQuery.of(context).size.width - 50.0) / 3,
                            height:
                                (MediaQuery.of(context).size.width - 50.0) / 3,
                            color: Colors.white,
                          ),
                          SizedBox(height: 5.0),
                          Column(
                            children: <Widget>[
                              Container(
                                width: (MediaQuery.of(context).size.width - 50.0) / 3,
                                height: 20.0,
                                color: Colors.white,
                              ),
                              SizedBox(height: 5.0),
                              Container(
                                width: (MediaQuery.of(context).size.width - 50.0) / 3,
                                height: 20.0,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
