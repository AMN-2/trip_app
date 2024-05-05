import 'package:hive/hive.dart';
import 'package:trip_app/features/trip/data/models/trip_model.dart';

class TripLocalDataSource {
  final Box<TripModel> tripBox;

  TripLocalDataSource(this.tripBox);
  // get all trip list function => List Of TripModel
  List<TripModel> getTrips() {
    return tripBox.values.toList();
  }

  // Add Trip Function
  void addTrip(TripModel trip) {
    tripBox.add(trip);
  }

  // Delete Trip Function
  void deleteTrip(int index) {
    tripBox.delete(index);
  }
}
