import 'package:flutter/material.dart';
import 'package:travel/route/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:travel/presentation/blocs/spot_pool/spot_pool_bloc.dart';
import 'package:travel/presentation/components/common_sliver_delegate.dart';

import './components/compoents.dart';

class SpotPage extends StatelessWidget {
  const SpotPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RefreshController _refreshController =
        RefreshController(initialRefresh: false);
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocConsumer<SpotPoolBloc, SpotPoolState>(
        listener: (context, state) {},
        buildWhen: (previous, current) {
          if (current is SpotPoolLoading || current is SpotPoolLoadFailed) {
            return false;
          } else if (current is SpotPoolLoaded) {
            return current.isNeedBuild;
          } else {
            return true;
          }
        },
        //ignore: missing_return
        builder: (context, state) {
          if (state is SpotPoolUninitialized || state is SpotPoolInitializing) {
            return Center(
              child: Text('Loading....'),
            );
          }
          if (state is SpotPoolInitializeFailed) {
            return Center(
              child: Text('Load Failed....'),
            );
          }
          if (state is SpotPoolLoaded) {
            return NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: CommonSliverPersistentHeaderDelegate(
                      height: 40.0,
                      child: SpotFilterTabBar(
                        spotFilters: state.filters,
                        currentFilter: state.currentFilter,
                        isFilterOpen: state.isFilterOpen,
                      ),
                    ),
                  ),
                ];
              },
              body: SpotFilterContent(
                body: BlocBuilder<SpotPoolBloc, SpotPoolState>(
                  //ignore: missing_return
                  builder: (context, state) {
                    if (state is SpotPoolLoaded) {
                      if (state.isReloading) {
                        return Center(
                          child: Text('Reloading...'),
                        );
                      } else {
                        return SmartRefresher(
                          controller: _refreshController,
                          enablePullDown: false,
                          enablePullUp: true,
                          child: ListView.builder(
                            itemCount: state.spots.length,
                            itemBuilder: (context, index) => SpotCoverCard(
                              spot: state.spots[index],
                            ),
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () => GlobalRoute.router.pop(context),
      ),
      title: Container(
        width: double.infinity,
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.search,
              color: Colors.black38,
              size: 19.0,
            ),
            SizedBox(width: 5.0),
            Text(
              '搜索背景景点玩乐',
              style: TextStyle(
                color: Colors.black38,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
