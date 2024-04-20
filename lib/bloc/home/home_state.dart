import 'package:restaurant/models/table.dart';

class HomeState{
  final bool isLoading;
  final bool isSuccess;
  final List<Table> tables;

  HomeState({this.isLoading = true, this.isSuccess = false, this.tables = const []});

  HomeState copyWith({bool? isLoading, bool? isSuccess, List<Table>? tables}){
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      tables: tables ?? this.tables,
    );

  }



}