abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsLoaded extends DetailsState {}

class DetailsError extends DetailsState {
  final String message;
  DetailsError(this.message);
}
