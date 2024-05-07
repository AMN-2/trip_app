import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:trip_app/features/trip/data/dataSouces/trip_local_datasource.dart';
import 'package:trip_app/features/trip/data/models/trip_model.dart';
import 'package:trip_app/features/trip/data/repositories/trip_repository_impl.dart';
import 'package:trip_app/features/trip/domain/repositories/trip_repository.dart';
import 'package:trip_app/features/trip/domain/usecases/add_trip.dart';
import 'package:trip_app/features/trip/domain/usecases/delete_trip.dart';
import 'package:trip_app/features/trip/domain/usecases/get_trip.dart';

// trip local datasource repository
final tripLocalDataSourceProvider = Provider<TripLocalDataSource>((ref) {
  final Box<TripModel> localDataSource = Hive.box('trips');
  return TripLocalDataSource(localDataSource);
});

// trip repo provider use as repository in function of crud
final tripRepositoryProvider = Provider<TripRepository>((ref) {
  final repo = ref.watch(tripLocalDataSourceProvider);
  return TripRepositoryImpl(repo);
});

// add trip provider

final addTripProvider = Provider<AddTrip>((ref) {
  final tripRepo = ref.watch(tripRepositoryProvider);
  return AddTrip(tripRepo);
});

//  get trips provider
final getTripProvider = Provider<GetTrip>((ref) {
  final repo = ref.watch(tripRepositoryProvider);
  return GetTrip(repo);
});

// delete trip provider
final deleteTripProvider = Provider<DeleteTrip>((ref) {
  final repo = ref.watch(tripRepositoryProvider);
  return DeleteTrip(repo);
});
