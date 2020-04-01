import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class SpotMomentCard extends StatelessWidget {

  final EdgeInsets padding;
  const SpotMomentCard({
    Key key,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.0,
      width: double.infinity,
      padding: padding == null ? EdgeInsets.only(
        top: 15.0,
        bottom: 15.0,
      ) : padding,
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(10.0),
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(246, 247, 249, 1.0),
          ),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: ExtendedNetworkImageProvider(
                  'https://p1-q.mafengwo.net/s15/M00/96/01/CoUBGV4pHj6AdsKGAADkQCnAbQE62.jpeg?imageMogr2%2Fthumbnail%2F%21120x120r%2Fgravity%2FCenter%2Fcrop%2F%21120x120%2Fquality%2F90',
                ),
              ),
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Bufeng6',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        margin: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'LV.15',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '一天前',
                    style: TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            '的理解发生的和解放拉萨的飞机哈里斯地方奥地利房间阿里山的分机号阿萨的腹肌拉伤点击返回拉萨的啊手机打开法律实践地方阿萨的加法和螺丝钉解放和',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: ExtendedImage.network(
                    'https://p1-q.mafengwo.net/s15/M00/71/1F/CoUBGV5PdKCAGRvzABsUyL61qoA494.jpg?imageMogr2%2Fthumbnail%2F360x%2Fstrip%2Fquality%2F90',
                    fit: BoxFit.cover,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: 2.0, bottom: 1.0),
                          child: ExtendedImage.network(
                            'https://b1-q.mafengwo.net/s15/M00/FC/A8/CoUBGV5LTnaAJltkAAeo472zxks97.jpeg?imageMogr2%2Fthumbnail%2F540x%2Fstrip%2Fquality%2F90%7Cwatermark%2F1%2Fimage%2FaHR0cHM6Ly9wMS1xLm1hZmVuZ3dvLm5ldC9zMTMvTTAwLzkyLzNEL3dLZ0VhVnhfaFRXQUFrVEVBQUJmN1M4NUt2MDI2Mi5wbmc_aW1hZ2VNb2dyMiUyRnRodW1ibmFpbCUyRjcyeCUyRnN0cmlwJTJGcXVhbGl0eSUyRjkw%2Fgravity%2FSouthWest%2Fdx%2F16%2Fdy%2F16',
                            fit: BoxFit.cover,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: 2.0, top: 1.0),
                          child: ExtendedImage.network(
                            'https://b1-q.mafengwo.net/s15/M00/FC/A8/CoUBGV5LTnaAJltkAAeo472zxks97.jpeg?imageMogr2%2Fthumbnail%2F540x%2Fstrip%2Fquality%2F90%7Cwatermark%2F1%2Fimage%2FaHR0cHM6Ly9wMS1xLm1hZmVuZ3dvLm5ldC9zMTMvTTAwLzkyLzNEL3dLZ0VhVnhfaFRXQUFrVEVBQUJmN1M4NUt2MDI2Mi5wbmc_aW1hZ2VNb2dyMiUyRnRodW1ibmFpbCUyRjcyeCUyRnN0cmlwJTJGcXVhbGl0eSUyRjkw%2Fgravity%2FSouthWest%2Fdx%2F16%2Fdy%2F16',
                            fit: BoxFit.cover,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
