part of 'db_bloc.dart';

@immutable
abstract class DbEvent {}

class DbEventRequested extends DbEvent {}
class DbEventRefreshRequested extends DbEvent {}
