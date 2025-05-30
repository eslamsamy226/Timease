import '../../../data/models/event_model.dart';

abstract class UserEventsState {}

class UserEventInitial extends UserEventsState {}

class GetUserEventsLoading extends UserEventsState {}

class GetUserEventsSuccess extends UserEventsState {
  List<EventModel> eventsListModel;

  GetUserEventsSuccess({required this.eventsListModel});
}

class GetUserEventsFailure extends UserEventsState {
  final String errMessage;

  GetUserEventsFailure({required this.errMessage});
}




class SearchEventsState extends UserEventsState {
  List<EventModel> eventsListModel;

  SearchEventsState({required this.eventsListModel});
}

class DeleteUserEventsLoading extends UserEventsState {}

class DeleteUserEventsSuccess extends UserEventsState {
  final bool isDeleted;

  DeleteUserEventsSuccess({required this.isDeleted});
}

class DeleteUserEventsFailure extends UserEventsState {
  final String errMessage;

  DeleteUserEventsFailure({required this.errMessage});
}

class CreateEventsLoading extends UserEventsState {}

class CreateEventsSuccess extends UserEventsState {
  EventModel createEventResponseModel;

  CreateEventsSuccess({required this.createEventResponseModel});
}

class CreateEventsFailure extends UserEventsState {
  final String errMessage;

  CreateEventsFailure({required this.errMessage});
}

class UpdateEventsLoading extends UserEventsState {}

class UpdateEventsSuccess extends UserEventsState {
  EventModel updateEventResponseModel;

  UpdateEventsSuccess({required this.updateEventResponseModel});
}

class UpdateEventsFailure extends UserEventsState {
  final String errMessage;

  UpdateEventsFailure({required this.errMessage});
}