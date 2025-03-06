import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:timease_mobile/core/errors/failure.dart';
import 'package:timease_mobile/core/utils/api_service.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
import 'package:timease_mobile/features/event/data/repos/event_repo.dart';

class EventRepoImpl implements EventRepo {
  ApiService apiService;

  EventRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<EventModel>>> getUserEvents() async {
    try {
      var json = await apiService.get(
        endPoint: 'event',
      );
      List<EventModel> userEventsList = [];
      for (var element in json['events']) {
        userEventsList.add(EventModel.fromJson(element));
      }
      return right(userEventsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(dioError: e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUserEventsItem(
      {required String eventId}) async {
    try {
      await apiService.delete(
        endPoint: 'event/$eventId',
      );
      return right(true);
    } catch (e) {
      debugPrint("999999999999999999999999999999");
      if (e is DioException) {
        return left(ServerFailure.fromDioError(dioError: e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
