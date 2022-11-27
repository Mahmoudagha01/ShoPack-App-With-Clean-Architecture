part of 'global_bloc.dart';

abstract class GlobalState extends Equatable {
  const GlobalState();
  
  @override
  List<Object> get props => [];
}

class GlobalInitial extends GlobalState {}
//class ChangedBNBState extends GlobalState {}
class HomeState extends GlobalState {
  final int index = 0;
  final String title = 'Home';

  @override
  List<Object> get props => [index, title];
}

class MapState extends GlobalState {
  final int index = 1;
  final String title = 'Map';

  @override
  List<Object> get props => [index, title];
}