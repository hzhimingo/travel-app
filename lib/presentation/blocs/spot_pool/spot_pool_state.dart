part of 'spot_pool_bloc.dart';

abstract class SpotPoolState extends Equatable {
  const SpotPoolState();
}

class SpotPoolUninitialized extends SpotPoolState {
  @override
  List<Object> get props => [];
}

class SpotPoolInitializing extends SpotPoolState {
  @override
  List<Object> get props => [];
}

class SpotPoolInitializeFailed extends SpotPoolState {
  @override
  List<Object> get props => [];
}

class SpotPoolInitialized extends SpotPoolState {
  final bool isFilterOpen;
  final int currentFilter;
  final bool isNeedBuild;
  final bool isLoading;
  final bool isFailed;
  final List<SpotFilter> filters;
  final List<Spot> spots;

  SpotPoolInitialized({
    this.isFilterOpen,
    this.currentFilter,
    this.isNeedBuild,
    this.filters,
    this.spots,
    this.isLoading,
    this.isFailed,
  });

  ///初始化成功， 导入数据
  factory SpotPoolInitialized.initialized(
      {List<SpotFilter> filters, List<Spot> spots}) {
    return SpotPoolInitialized(
      isFilterOpen: false,
      currentFilter: 0,
      isNeedBuild: true,
      isLoading: false,
      isFailed: false,
      filters: filters,
      spots: spots,
    );
  }

  SpotPoolInitialized update({
    bool isFilterOpen,
    int currentFilter,
    bool isNeedBuild,
    bool isLoading,
    bool isFailed,
    List<SpotFilter> filters,
    List<Spot> spots,
  }) {
    return SpotPoolInitialized(
      isFilterOpen: isFilterOpen ?? this.isFilterOpen,
      currentFilter: currentFilter ?? this.currentFilter,
      isNeedBuild: isNeedBuild ?? this.isNeedBuild,
      isLoading: isLoading ?? this.isLoading,
      isFailed: isFailed ?? this.isFailed,
      filters: filters ?? this.filters,
      spots: spots ?? this.spots,
    );
  }

  @override
  List<Object> get props => [
        isFilterOpen,
        currentFilter,
        isNeedBuild,
        filters,
        spots,
      ];
}

class SpotPoolLoading extends SpotPoolState {
  @override
  List<Object> get props => [];
}

class SpotPoolLoaded extends SpotPoolState {
  final bool isFilterOpen;
  final int currentFilter;
  final bool isNeedBuild;
  final bool isReloading;
  final List<SpotFilter> filters;
  final List<Spot> spots;

  SpotPoolLoaded({
    this.isFilterOpen,
    this.currentFilter,
    this.isNeedBuild,
    this.isReloading,
    this.filters,
    this.spots,
  });

  //初始化成功， 导入数据
  factory SpotPoolLoaded.initialized({
    List<SpotFilter> filters,
    List<Spot> spots,
  }) {
    return SpotPoolLoaded(
      isFilterOpen: false,
      currentFilter: 0,
      isNeedBuild: true,
      isReloading: false,
      filters: filters,
      spots: spots,
    );
  }

  SpotPoolLoaded update({
    bool isFilterOpen,
    int currentFilter,
    bool isNeedBuild,
    bool isReloading,
    List<SpotFilter> filters,
    List<Spot> spots,
  }) {
    return SpotPoolLoaded(
      isFilterOpen: isFilterOpen ?? this.isFilterOpen,
      currentFilter: currentFilter ?? this.currentFilter,
      isNeedBuild: isNeedBuild ?? this.isNeedBuild,
      isReloading: isReloading ?? this.isReloading,
      filters: filters ?? this.filters,
      spots: spots ?? this.spots,
    );
  }

  @override
  List<Object> get props => [
        isFilterOpen,
        currentFilter,
        isNeedBuild,
        isReloading,
        filters,
        spots,
      ];
}

class SpotPoolLoadFailed extends SpotPoolState {
  @override
  List<Object> get props => [];
}
