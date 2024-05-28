//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:una/appPurpose.dart';
import 'package:una/childInfoUpdate.dart';
import 'package:una/createForm.dart';
import 'package:una/firstLogin.dart';
import 'package:una/parentInfoForm.dart';
import 'package:una/mainPage.dart';
import 'package:una/parentsMyPage.dart';
import 'package:una/reserve.dart';
import 'package:una/teacherLogin.dart';
import 'package:una/userLogin.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: FirstLogin.routeURL,
      name: FirstLogin.routeName,
      builder: (context, state) => const FirstLogin(),
    ),
    GoRoute(
      path: AppPurpose.routeURL,
      name: AppPurpose.routeName,
      builder: (context, state) => const AppPurpose(),
    ),
    GoRoute(
      path: TeacherLogin.routeURL,
      name: TeacherLogin.routeName,
      builder: (context, state) => const TeacherLogin(),
    ),
    GoRoute(
      path: UserLogin.routeURL,
      name: UserLogin.routeName,
      builder: (context, state) => const UserLogin(),
    ),
    GoRoute(
      path: ParentInfoForm.routeURL,
      name: ParentInfoForm.routeName,
      builder: (context, state) {
        final parentInfo = state.extra as Map<String, dynamic>;
        return ParentInfoForm(parentInfo: parentInfo);
      },
    ),
    GoRoute(
      path: MainPage.routeURL,
      name: MainPage.routeName,
      builder: (context, state) => const MainPage(),
    ),
    // GoRoute(
    //   path: Reserve.routeURL,
    //   name: Reserve.routeName,
    //   builder: (context, state) => const Reserve(),
    // ),
    // GoRoute(
    //   path: CreateForm.routeURL,
    //   name: CreateForm.routeName,
    //   builder: (context, state) => const CreateForm(),
    // ),
    GoRoute(
      path: ParentsMyPage.routeURL,
      name: ParentsMyPage.routeName,
      builder: (context, state) => const ParentsMyPage(),
    ),
    GoRoute(
      path: '/edit-child/:parentKakaoId/:childName',
      builder: (context, state) {
        final parentKakaoId = state.pathParameters['parentKakaoId']!;
        final childName = state.pathParameters['childName']!;
        return ChildInfoUpdate(
            parentKakaoId: parentKakaoId, childName: childName);
      },
    ),
  ],
);
