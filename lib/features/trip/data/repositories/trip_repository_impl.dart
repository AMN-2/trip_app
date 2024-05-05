import 'package:trip_app/features/trip/data/dataSouces/trip_local_datasource.dart';
import 'package:trip_app/features/trip/data/models/trip_model.dart';
import 'package:trip_app/features/trip/domain/entities/trip.dart';
import 'package:trip_app/features/trip/domain/repositories/trip_repository.dart';

class TripRepositoryImpl implements TripRepository {
  final TripLocalDataSource localDataSource;

  TripRepositoryImpl(this.localDataSource);

  @override
  Future<void> addTrip(Trip trip) async {
    final tripModel = TripModel.fromEntity(trip);
    localDataSource.addTrip(tripModel);
  }

  @override
  Future<void> deleteTrip(int index) async {
    localDataSource.deleteTrip(index);
  }

  @override
  Future<List<Trip>> getTrips() async {
    final tripModels = localDataSource.getTrips();
    List<Trip> trips = tripModels.map((model) => model.toEntity()).toList();
    return trips;
  }
}
