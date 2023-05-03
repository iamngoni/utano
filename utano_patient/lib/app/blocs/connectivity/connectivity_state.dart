part of 'connectivity_bloc.dart';

@immutable
abstract class ConnectivityState {}

class ConnectivityIdle extends ConnectivityState {}

class ConnectivityConnected extends ConnectivityState {}

class ConnectivityDisconnected extends ConnectivityState {}
