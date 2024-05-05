import 'package:trip_app/features/trip/domain/repositories/trip_repository.dart';

class GetTrip {
  final TripRepository repository;

  GetTrip(this.repository);

  Future<void> call() {
    return repository.getTrips();
  }
}
