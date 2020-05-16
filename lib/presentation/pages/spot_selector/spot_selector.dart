import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:travel/entity/simple_spot.dart';
import 'package:travel/presentation/blocs/simple_spot_pool/simple_spot_pool_bloc.dart';
import 'package:travel/route/routes.dart';

class SpotSelector extends StatelessWidget {
  const SpotSelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.8,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            GlobalRoute.router.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "附近景点",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: BlocBuilder<SimpleSpotPoolBloc, SimpleSpotPoolState>(
        builder: (context, state) {
          if (state is SimpleSpotPoolLoading || state is SimpleSpotPoolEmpty) {
            return Center(
              child: SpinKitRing(
                color: Theme.of(context).primaryColor,
              ),
            );
          }
          if (state is SimpleSpotPoolLoadFailed) {
            return Center(
              child: Text(
                '加载失败了'
              ),
            );
          }
          if (state is SimpleSpotPoolLoaded) {
            return ListView.builder(
              itemCount: state.simpleSpots.length,
              itemBuilder: (context, index) => SpotSelectorItem(
                spot: state.simpleSpots[index],
                onPressed: (spot) {
                  Navigator.pop(context, spot);
                },
              ),
            );
          }
        },
      ),
    );
  }
}

class SpotSelectorItem extends StatelessWidget {
  final SimpleSpot spot;
  final ValueChanged<SimpleSpot> onPressed;

  const SpotSelectorItem({Key key, this.spot, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed(spot);
      },
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[200],
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '景点-${spot.spotName}',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6.0),
            Text(spot.address),
          ],
        ),
      ),
    );
  }
}
