import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';

class SpotMap extends StatelessWidget {
  const SpotMap({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0.0,
            top: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              child: AmapView(
                // 地图类型 (可选)
                mapType: MapType.Standard,
                // 是否显示缩放控件 (可选)
                showZoomControl: false,
                // 是否显示指南针控件 (可选)
                showCompass: false,
                // 是否显示比例尺控件 (可选)
                showScaleControl: false,
                // 是否使能缩放手势 (可选)
                zoomGesturesEnabled: true,
                // 是否使能滚动手势 (可选)
                scrollGesturesEnabled: true,
                // 是否使能旋转手势 (可选)
                rotateGestureEnabled: true,
                // 是否使能倾斜手势 (可选)
                tiltGestureEnabled: true,
                // 缩放级别 (可选)
                zoomLevel: 15,
                // 中心点坐标 (可选)
                centerCoordinate: LatLng(39, 116),
                // 标记 (可选)
                markers: <MarkerOption>[],
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            top: MediaQuery.of(context).size.height * 0.5,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          Positioned(
            left: 10.0,
            top: 45.0,
            child: Container(
              width: 45.0,
              height: 45.0,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: () {
                  GlobalRoute.router.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
