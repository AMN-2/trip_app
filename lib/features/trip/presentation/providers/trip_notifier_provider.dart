import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_app/features/trip/domain/entities/trip.dart';
import 'package:trip_app/features/trip/domain/usecases/add_trip.dart';
import 'package:trip_app/features/trip/domain/usecases/delete_trip.dart';
import 'package:trip_app/features/trip/domain/usecases/get_trip.dart';
import 'package:trip_app/features/trip/presentation/providers/trip_provider.dart';

final tripNotifierProvider =
    StateNotifierProvider<TripListNotifier, List<Trip>>((ref) {
  final getTrips = ref.watch(getTripProvider);
  final addTrip = ref.watch(addTripProvider);
  final deleteTrip = ref.watch(deleteTripProvider);
  return TripListNotifier(getTrips, addTrip, deleteTrip);
});

class TripListNotifier extends StateNotifier<List<Trip>> {
  final GetTrip _getTrip;
  final AddTrip _addTrip;
  final DeleteTrip _deleteTrip;
  TripListNotifier(this._getTrip, this._addTrip, this._deleteTrip) : super([]);

// Get Trips
  loadTrips() async {
    await _getTrip();
  }

  // Add A New Trip
  addNewTrip(Trip trip) async {
    _addTrip(trip);
  }

// Delete Trip
  removeTrips(int tripId) async {
    await _deleteTrip.call(tripId);
  }
}
