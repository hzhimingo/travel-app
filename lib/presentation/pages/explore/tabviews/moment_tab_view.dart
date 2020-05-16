import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterfall_flow/waterfall_flow.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:travel/presentation/components/moment_cover_card.dart';
import 'package:travel/presentation/components/custom_drop_header.dart';
import 'package:travel/presentation/blocs/moment_pool/moment_pool_bloc.dart';

class MomentTabView extends StatefulWidget {
  MomentTabView({Key key}) : super(key: key);

  @override
  _MomentTabViewState createState() => _MomentTabViewState();
}

class _MomentTabViewState extends State<MomentTabView>
    with AutomaticKeepAliveClientMixin {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<MomentPoolBloc, MomentPoolState>(
      listener: (context, state) {
        if (state is MomentPoolLoaded) {
          if (!state.page.hasNext) {
            _refreshController.loadNoData();
          }
          if (_refreshController.isRefresh) {
            _refreshController.refreshCompleted();
          }
          if (_refreshController.isLoading) {
            _refreshController.loadComplete();
          }
        }
        if (state is MomentPoolLoadFailure) {
          if (_refreshController.isRefresh) {
            _refreshController.refreshFailed();
          }
          if (_refreshController.isLoading) {
            _refreshController.loadFailed();
          }
        }
      },
      buildWhen: (previous, current) {
        if (current is MomentPoolLoadFailure || current is MomentPoolLoading) {
          return false;
        } else {
          return true;
        }
      },
      //ignore: missing_return
      builder: (context, state) {
        if (state is MomentPoolInitializing) {
          return Center(
            child: SpinKitThreeBounce(
              color: Theme.of(context).primaryColor,
              size: 33.0,
            ),
          );
        }
        if (state is MomentPoolEmpty) {
          return Center(
            child: Text('加载失败，请重新尝试'),
          );
        }
        if (state is MomentPoolLoaded) {
          return Container(
            padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
            child: SmartRefresher(
              controller: _refreshController,
              enablePullUp: true,
              enablePullDown: true,
              onRefresh: () => context.bloc<MomentPoolBloc>().add(RefreshMomentPool()),
              onLoading: () => context.bloc<MomentPoolBloc>().add(LoadMoreMomentCovers(
                boundary: state.page.boundary + state.page.offset,
                offset: state.page.offset
              )),
              header: CustomDropHeader(),
              footer: ClassicFooter(),
              child: WaterfallFlow.builder(
                itemCount: state.page.data.length,
                gridDelegate: SliverWaterfallFlowDelegate(
                  crossAxisCount: 2,
                  collectGarbage: (List<int> garbages) {
                    garbages.forEach(
                      (index) {
                        final provider = ExtendedNetworkImageProvider(
                          state.page.data[index].coverImage.url,
                        );
                        provider.evict();
                      },
                    );
                  },
                ),
                itemBuilder: (context, index) => MomentCoverCard(
                  momentCover: state.page.data[index],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
