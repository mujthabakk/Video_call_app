import 'package:flutter/material.dart';
import 'app.dart';
import 'features/video_call/store/video_call_store.dart';

// old version flutter
void main() {
  // Create store instance
  final videoCallStore = VideoCallStore();

  // Initialize with random channel
  videoCallStore.generateRandomChannel();

  // Run the app
  runApp(MyApp(videoCallStore: videoCallStore));
}
