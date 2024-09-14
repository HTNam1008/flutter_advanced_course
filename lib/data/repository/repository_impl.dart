import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/data/data_source/remote_data_source.dart';
import 'package:flutter_application_1/data/mapper/mapper.dart';
import 'package:flutter_application_1/data/network/failure.dart';
import 'package:flutter_application_1/data/network/network_info.dart';
import 'package:flutter_application_1/data/request/request.dart';
import 'package:flutter_application_1/domain/model.dart';
import 'package:flutter_application_1/domain/repository.dart';

class RepositoryImpl implements  Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // its safe to call
      final response = await _remoteDataSource.login(loginRequest);
      if (response.status == 0) {
        // return data (success)
        // return right
        return Right(response.toDomain());
      } else {
        // return business logic error
        // return left
        return Left(Failure(
            409, response.message ?? "we have business error from API side"));
      }
    } else {
      // return connection error
      return Left(Failure(501, "please check your internet connection"));
    }
  }
}
