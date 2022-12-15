import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'BottomNavigationBar_event.dart';
part 'BottomNavigationBar_state.dart';

class BottomNavigationBarBloc
    extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
 
  BottomNavigationBarBloc() : super(HomeState()) {

    on<LoadHome>((event, emit) => emit( HomeState()));
    on<LoadShop>((event, emit) => emit( ShopState()));
    on<LoadBag>((event, emit) => emit( BagState()));
    on<LoadFavorite>((event, emit) => emit( FavoriteState()));
    on<LoadProfile>((event, emit) => emit( ProfilePageState()));
  }
}
