import 'package:flutter/material.dart';
import 'core/constants/app_constants.dart';
import 'features/video_call/presentation/pages/home_page.dart';
import 'features/video_call/store/video_call_store.dart';

class MyApp extends StatelessWidget {
  final VideoCallStore videoCallStore;

  const MyApp({Key? key, required this.videoCallStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      home: HomePage(videoCallStore: videoCallStore),
    );
  }
}
