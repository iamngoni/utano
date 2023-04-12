part of 'system_configs_bloc.dart';

abstract class SystemConfigsEvent extends Equatable {
  const SystemConfigsEvent();
}

class LoadSystemConfigs extends SystemConfigsEvent {
  @override
  List<Object> get props => [];
}
