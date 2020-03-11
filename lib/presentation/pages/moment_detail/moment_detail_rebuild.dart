import 'package:flutter/material.dart';
import 'package:travel/entity/moment_detail.dart';
import 'package:travel/entity/picture.dart';
import 'package:travel/presentation/pages/moment_detail/components/bottom_action_panel.dart';
import 'package:travel/presentation/pages/moment_detail/components/components.dart';
import 'package:travel/presentation/pages/moment_detail/components/liked_user_line.dart';
import 'package:travel/presentation/pages/moment_detail/components/location_line.dart';
import 'package:travel/presentation/pages/moment_detail/components/moment_content.dart';
import 'package:travel/presentation/pages/moment_detail/components/moment_detail_picture_pool.dart';
import 'package:travel/route/routes.dart';

var momentDetail = MomentDetail(
    momentId: 12356456,
    title: '墨西哥风味健康快餐店Chipotle',
    content:
        '墨西哥风味健康快餐店Chipotle\nChipotle，是一家墨西哥风味的健康快餐连锁店. 至今， 已在全球20几个国家开了分店. 店内的特色就是墨西哥卷饼，和墨西哥玉米卷饼！\n订餐者，自主选择，自行搭配.\n图四：今日订单\n图五-十一： 可选食材\n自选肉类或素餐\n自选米饭豆类\n自选搭配菜\n自选酱料\n\n成品：碗装， 墨西哥卷饼， Taco墨西哥玉米饼\n\n我通常都点碗装的，因为吃起来方便.\n\n第一图，就是我今天搭配好的餐！ 量满大，看起来颜色搭配也不错，并且还比较健康. \n\n网上订购，店里直接取，很方便！ 注册账号，订餐积点，得免费一餐！ \n\n满好吃，又健康，我经常来此买上一份😋',
    authorId: 123123123,
    avatar:
        'https://p1-q.mafengwo.net/s15/M00/79/52/CoUBGV24CsCAeYwKAAJur0e2ciE02.jpeg?imageMogr2%2Fthumbnail%2F%21120x120r%2Fgravity%2FCenter%2Fcrop%2F%21120x120%2Fquality%2F90',
    nickname: "Fisher",
    city: '珠海',
    locationName: '东也杂货铺',
    commentNum: 2,
    favNum: 30,
    starNum: 9,
    isFav: 0,
    isStar: 0,
    favUsers: [
      "https://b1-q.mafengwo.net/s15/M00/08/9A/CoUBGV3p88uAIXBQAADHFDEQeOc61.jpeg?imageMogr2%2Fthumbnail%2F%21120x120r%2Fgravity%2FCenter%2Fcrop%2F%21120x120%2Fquality%2F90",
      "https://b1-q.mafengwo.net/s10/M00/29/9C/wKgBZ1jw5BeAam9tAACk0xjs_B012.jpeg?imageMogr2%2Fthumbnail%2F%21120x120r%2Fgravity%2FCenter%2Fcrop%2F%21120x120%2Fquality%2F90",
      "https://p1-q.mafengwo.net/s15/M00/96/01/CoUBGV4pHj6AdsKGAADkQCnAbQE62.jpeg?imageMogr2%2Fthumbnail%2F%21120x120r%2Fgravity%2FCenter%2Fcrop%2F%21120x120%2Fquality%2F90",
      "https://b1-q.mafengwo.net/s15/M00/B6/94/CoUBGV4TKHiAUBdSAALrMs12M0c49.jpeg?imageMogr2%2Fthumbnail%2F%21120x120r%2Fgravity%2FCenter%2Fcrop%2F%21120x120%2Fquality%2F90",
      "https://p1-q.mafengwo.net/s9/M00/EB/0B/wKgBs1aiUqCAe2vxABCBA3pOIJI56.jpeg?imageMogr2%2Fthumbnail%2F%21120x120r%2Fgravity%2FCenter%2Fcrop%2F%21120x120%2Fquality%2F90"
    ],
    pictures: [
      Picture(
        pictureId: 51240261,
        url:
            "https://p1-q.mafengwo.net/s15/M00/03/66/CoUBGV5OJcKAPjFNABdYef7Ym4821.jpeg?imageMogr2%2Fthumbnail%2F360x%2Fstrip%2Fquality%2F90%7Cwatermark%2F1%2Fimage%2FaHR0cHM6Ly9wMS1xLm1hZmVuZ3dvLm5ldC9zMTMvTTAwLzkyLzNEL3dLZ0VhVnhfaFRXQUFrVEVBQUJmN1M4NUt2MDI2Mi5wbmc_aW1hZ2VNb2dyMiUyRnRodW1ibmFpbCUyRjQ4eCUyRnN0cmlwJTJGcXVhbGl0eSUyRjkw%2Fgravity%2FSouthWest%2Fdx%2F10%2Fdy%2F10",
        width: 1920,
        height: 2880,
      ),
      Picture(
        pictureId: 51229712,
        url:
            "https://p1-q.mafengwo.net/s15/M00/B8/26/CoUBGV5N69uAEeiFABuNudh3dzc38.jpeg?imageMogr2%2Fthumbnail%2F540x%2Fstrip%2Fquality%2F90%7Cwatermark%2F1%2Fimage%2FaHR0cHM6Ly9wMS1xLm1hZmVuZ3dvLm5ldC9zMTMvTTAwLzkyLzNEL3dLZ0VhVnhfaFRXQUFrVEVBQUJmN1M4NUt2MDI2Mi5wbmc_aW1hZ2VNb2dyMiUyRnRodW1ibmFpbCUyRjcyeCUyRnN0cmlwJTJGcXVhbGl0eSUyRjkw%2Fgravity%2FSouthWest%2Fdx%2F16%2Fdy%2F16",
        width: 2560,
        height: 1920,
      ),
      Picture(
        pictureId: 51198609,
        url:
            "https://n1-q.mafengwo.net/s15/M00/D2/14/CoUBGV5M9DyAO1ZmAANWxzXlhv4134.jpg?imageMogr2%2Fthumbnail%2F360x%2Fstrip%2Fquality%2F90%7Cwatermark%2F1%2Fimage%2FaHR0cHM6Ly9wMS1xLm1hZmVuZ3dvLm5ldC9zMTMvTTAwLzkyLzNEL3dLZ0VhVnhfaFRXQUFrVEVBQUJmN1M4NUt2MDI2Mi5wbmc_aW1hZ2VNb2dyMiUyRnRodW1ibmFpbCUyRjQ4eCUyRnN0cmlwJTJGcXVhbGl0eSUyRjkw%2Fgravity%2FSouthWest%2Fdx%2F10%2Fdy%2F10",
        width: 1280,
        height: 720,
      ),
      Picture(
        pictureId: 51163308,
        url:
            "https://b1-q.mafengwo.net/s15/M00/B9/C0/CoUBGV5L0RaAPQfdAASYp1mHQ8c11.jpeg?imageMogr2%2Fthumbnail%2F360x%2Fstrip%2Fquality%2F90%7Cwatermark%2F1%2Fimage%2FaHR0cHM6Ly9wMS1xLm1hZmVuZ3dvLm5ldC9zMTMvTTAwLzkyLzNEL3dLZ0VhVnhfaFRXQUFrVEVBQUJmN1M4NUt2MDI2Mi5wbmc_aW1hZ2VNb2dyMiUyRnRodW1ibmFpbCUyRjQ4eCUyRnN0cmlwJTJGcXVhbGl0eSUyRjkw%2Fgravity%2FSouthWest%2Fdx%2F10%2Fdy%2F10",
        width: 1686,
        height: 1122,
      ),
      Picture(
        pictureId: 51240261,
        url:
            "https://p1-q.mafengwo.net/s15/M00/03/66/CoUBGV5OJcKAPjFNABdYef7Ym4821.jpeg?imageMogr2%2Fthumbnail%2F360x%2Fstrip%2Fquality%2F90%7Cwatermark%2F1%2Fimage%2FaHR0cHM6Ly9wMS1xLm1hZmVuZ3dvLm5ldC9zMTMvTTAwLzkyLzNEL3dLZ0VhVnhfaFRXQUFrVEVBQUJmN1M4NUt2MDI2Mi5wbmc_aW1hZ2VNb2dyMiUyRnRodW1ibmFpbCUyRjQ4eCUyRnN0cmlwJTJGcXVhbGl0eSUyRjkw%2Fgravity%2FSouthWest%2Fdx%2F10%2Fdy%2F10",
        width: 1920,
        height: 2880,
      ),
      Picture(
        pictureId: 51232927,
        url:
            "https://p1-q.mafengwo.net/s15/M00/CF/05/CoUBGV5N_X2AEKIzAAJ2fqOtvIg83.jpeg?imageMogr2%2Fthumbnail%2F360x%2Fstrip%2Fquality%2F90%7Cwatermark%2F1%2Fimage%2FaHR0cHM6Ly9wMS1xLm1hZmVuZ3dvLm5ldC9zMTMvTTAwLzkyLzNEL3dLZ0VhVnhfaFRXQUFrVEVBQUJmN1M4NUt2MDI2Mi5wbmc_aW1hZ2VNb2dyMiUyRnRodW1ibmFpbCUyRjQ4eCUyRnN0cmlwJTJGcXVhbGl0eSUyRjkw%2Fgravity%2FSouthWest%2Fdx%2F10%2Fdy%2F10",
        width: 1242,
        height: 931,
      ),
    ]);
var momentCovers = [];

class MomentDetailRebuild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            GlobalRoute.router.pop(context);
          },
        ),
        title: Row(
          children: <Widget>[
            
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.black, size: 30.0,),
            onPressed: (){},
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MomentDetailPicturePool(pictures: momentDetail.pictures),
                Offstage(
                  offstage: momentDetail.title == null,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 20.0,
                      left: 15.0,
                      right: 15.0,
                      bottom: 15.0,
                    ),
                    child: Text(
                      momentDetail.title,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'PingFangSCLight',
                      ),
                    ),
                  ),
                ),
                LocationLine(
                  city: '深圳',
                  location: '深圳市天文台',
                ),
                MomentContent(text: momentDetail.content),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text('2019-02-01发布'),
                ),
                LikedUserLine(
                  urls: momentDetail.favUsers,
                  favNum: 20,
                ),
              ],
            ),
          ),
          Positioned(
            left: 0.0,
            bottom: 0.0,
            child: BottomActionPanel(
              favNum: 10,
              starNum: 10,
              commentNum: 20,
              isFav: true,
              isStar: false,
            ),
          ),
        ],
      ),
    );
  }
}
