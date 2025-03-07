import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import '../../../core/constants/app_constants.dart';

class AgoraService {
  late RtcEngine _engine;

  Future<RtcEngine> initializeEngine() async {
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(appId: AppConstants.appId));
    return _engine;
  }

  Future<void> joinChannel(String channelName) async {
    await _engine.enableVideo();
    await _engine
        .setChannelProfile(ChannelProfileType.channelProfileLiveBroadcasting);
    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.joinChannel(
      token: "",
      channelId: channelName,
      uid: 0,
      options: const ChannelMediaOptions(),
    );
  }

  void leaveChannel() {
    _engine.leaveChannel();
  }

  void dispose() {
    _engine.release();
  }
}
