import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/constants.dart';
import 'package:timease_mobile/core/utils/api_service.dart';
import 'package:timease_mobile/core/utils/app_router.dart';
import 'package:timease_mobile/core/utils/cash_helper.dart';
import 'package:timease_mobile/core/utils/function/custom_awesome_dialog.dart';
import 'package:timease_mobile/features/authentication/data/repos/auth_repo_impl.dart';

class NotificationsScreenViewBody extends StatelessWidget {
  const NotificationsScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () async {
          AuthRepoImpl authRepoImpl =
              AuthRepoImpl(apiService: ApiService(dio: Dio()));
          var response = await authRepoImpl.logout(refreshToken: refreshToken);
          response.fold(
            (l) {
              customAwesomeDialog(context, message: l.toString());
            },
            (r) {
              refreshToken=accessToken='';
              CashHelper.removeData('refreshToken');
              CashHelper.removeData('accessToken');
              context.go(AppRouter.authScreen);
            },
          );
        },
        child: Text('LOGOUT'),
      ),
    );
  }
}
