import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:timease_mobile/core/errors/failure.dart';
import 'package:timease_mobile/core/utils/api_service.dart';
import 'package:timease_mobile/features/authentication/data/models/login_model.dart';
import 'package:timease_mobile/features/authentication/data/models/register_model.dart';
import 'package:timease_mobile/features/authentication/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
   ApiService apiService;

  AuthRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      var json = await apiService.post(
        endPoint: 'login',
        body: {
          'email': email,
          'password': password
        },
      );
    LoginModel loginModel= LoginModel.fromJson(json);
    print('object');
      return right(loginModel);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(dioError: e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    try {
      var json = await apiService.post(
        endPoint: 'signup',
        body: {
          "firstName": firstName,
          "lastName": lastName,
          'email': email,
          'password': password
        },
      );
      RegisterModel registerModel= RegisterModel.fromJson(json);
      return Right(registerModel);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(dioError: e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
