import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/home/home_event.dart';
import 'package:restaurant/bloc/home/home_state.dart';
import 'package:restaurant/models/table.dart';
import 'package:restaurant/services/share_preference_service.dart';
import 'package:restaurant/services/table_service.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  final TableService _tableService;

  HomeBloc({required TableService tableService}) : _tableService = tableService, super(HomeState()){
    on<EventLoading>(_loadingTable);
    // on<EventFilter>();
  }

  Future<void> _loadingTable(EventLoading event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    try{
      String token = await SharedPreferencesService.getToken();
      List<Table> tables = await _tableService.getAllTable(token);
      emit(state.copyWith(isLoading: false, isSuccess: true, tables: tables));
    } catch(e){
      emit(state.copyWith(isLoading: false));
    }
    emit(state.copyWith(isLoading: false));
  }
}