part of 'db_bloc.dart';

@immutable
abstract class DbState {}

class DbInitial extends DbState {}

class DbLoadInProgress extends DbState {}

class DbLoadSuccess extends DbState {}

class DbLoadFailure extends DbState {}

class DbRefreshInProgress extends DbState {}
