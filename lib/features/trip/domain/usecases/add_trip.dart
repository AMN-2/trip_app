import 'package:trip_app/features/trip/domain/entities/trip.dart';
import 'package:trip_app/features/trip/domain/repositories/trip_repository.dart';

class AddTrip {
  final TripRepository repository;

  AddTrip(this.repository);

  Future<void> addTrip(Trip trip) {
    return repository.addTrip(trip);
  }
}
