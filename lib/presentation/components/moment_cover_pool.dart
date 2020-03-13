import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/injection/injection.dart';
import 'package:travel/presentation/blocs/moment_pool/moment_pool_bloc.dart';
import 'package:travel/presentation/pages/explore/tabviews/moment_tab_view.dart';

class MomentCoverPool extends StatelessWidget {
  const MomentCoverPool({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MomentPoolBloc>(
      create: (context) =>
          getIt.get<MomentPoolBloc>()..add(InitializeMomentPool()),
      child: MomentTabView(),
    );
  }
}
