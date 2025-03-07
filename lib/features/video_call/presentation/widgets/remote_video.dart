import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';

class RemoteVideo extends StatelessWidget {
  final RtcEngine engine;
  final int? remoteUid;
  final String channelName;

  const RemoteVideo({
    Key? key,
    required this.engine,
    required this.remoteUid,
    required this.channelName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: engine,
          canvas: VideoCanvas(uid: remoteUid),
          connection: RtcConnection(channelId: channelName),
        ),
      );
    }
    return const Center(
      child: Text(
        'Waiting for friends to join...',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          shadows: [Shadow(color: Colors.black, blurRadius: 4)],
        ),
      ),
    );
  }
}
