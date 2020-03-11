import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/injection/injection.dart';
import 'package:travel/presentation/blocs/login/login_bloc.dart';
import 'package:travel/presentation/blocs/moment_detail/moment_detail_bloc.dart';
import 'package:travel/presentation/pages/moment_detail/moment_detail_rebuild.dart';
import 'package:travel/presentation/pages/pages.dart';

var rootHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Root();
  },
);

var loginHandler = Handler(
  type: HandlerType.function,
  //ignore: missing_return
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return BlocProvider<LoginBloc>(
            create: (context) => getIt.get<LoginBloc>(),
            child: Login(),
          );
        },
      ),
    );
  },
);

var popHandler = Handler(
  type: HandlerType.function,
  //ignore: missing_return
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return Pop();
        },
      ),
    );
  },
);

var settingsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Settings();
  },
);

var momentDetailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String momentId = params['momentId'].first;
    print(momentId);
    // return BlocProvider<MomentDetailBloc>(
    //   create: (context) => getIt.get<MomentDetailBloc>()..add(FetchMomnetDetail(momentId: int.parse(momentId))),
    //   child: MomentDetail(),
    // );
    return MomentDetailRebuild();
  },
);
