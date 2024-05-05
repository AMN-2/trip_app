import 'package:trip_app/features/trip/domain/entities/trip.dart';
import 'package:trip_app/features/trip/domain/repositories/trip_repository.dart';

class GetTrip {
  final TripRepository repository;

  GetTrip(this.repository);

  Future<List<Trip>> call() {
    return repository.getTrips();
  }
}
