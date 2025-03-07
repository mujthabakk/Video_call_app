import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_call_app/core/constants/random_generator.dart';
import '../../../core/constants/app_constants.dart';

// Include this line to generate the required code
part 'video_call_store.g.dart';

class VideoCallStore = _VideoCallStore with _$VideoCallStore;

abstract class _VideoCallStore with Store {
  late RtcEngine _engine;

  // Getter to safely access the engine
  RtcEngine get engine => _engine;

  @observable
  bool isEngineInitialized = false;

  @observable
  String channelName = '';

  @observable
  bool isCustomChannel = false;

  @observable
  bool localUserJoined = false;

  @observable
  int? remoteUid;

  @observable
  bool isMuted = false;

  @observable
  bool isVideoMuted = false;

  @action
  void generateRandomChannel() {
    channelName = RandomGenerator.generateRandomChannel();
    isCustomChannel = false;
  }

  @action
  void setChannelName(String value) {
    channelName = value;
    isCustomChannel = true;
  }

  @action
  Future<void> handlePermissions() async {
    await [Permission.camera, Permission.microphone].request();
  }

  @action
  Future<void> initAgora(String channelName) async {
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(appId: AppConstants.appId));

    // Mark as initialized
    isEngineInitialized = true;

    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          localUserJoined = true;
        },
        onUserJoined: (RtcConnection connection, int uid, int elapsed) {
          remoteUid = uid;
        },
        onUserOffline:
            (RtcConnection connection, int uid, UserOfflineReasonType reason) {
          remoteUid = null;
        },
      ),
    );

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

  @action
  void toggleMute() {
    isMuted = !isMuted;
    _engine.muteLocalAudioStream(isMuted);
  }

  @action
  void toggleVideo() {
    isVideoMuted = !isVideoMuted;
    _engine.muteLocalVideoStream(isVideoMuted);
  }

  @action
  void switchCamera() {
    _engine.switchCamera();
  }

  @action
  void disposeEngine() {
    if (isEngineInitialized) {
      _engine.leaveChannel();
      _engine.release();
      isEngineInitialized = false;
    }
  }
}
