import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'db_event.dart';
part 'db_state.dart';

class DbBloc extends Bloc<DbEvent, DbState> {
  DbBloc() : super(DbInitial()) {
    on<DbEvent>((event, emit) {});
  }
}
