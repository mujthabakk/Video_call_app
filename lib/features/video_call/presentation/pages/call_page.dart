import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import '../../store/video_call_store.dart';
import '../widgets/control_button.dart';
import '../widgets/remote_video.dart';

class CallPage extends StatefulWidget {
  final VideoCallStore videoCallStore;

  const CallPage({
    Key? key,
    required this.videoCallStore,
  }) : super(key: key);

  @override
  CallPageState createState() => CallPageState();
}

class CallPageState extends State<CallPage> {
  @override
  void initState() {
    super.initState();
    _initializeCall();
  }

  Future<void> _initializeCall() async {
    await widget.videoCallStore.initAgora(widget.videoCallStore.channelName);
  }

  @override
  void dispose() {
    widget.videoCallStore.disposeEngine();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const NetworkImage(
                  'https://img.freepik.com/free-photo/business-video-call-representation_23-2148667503.jpg?semt=ais_hybrid',
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2),
                  BlendMode.dstATop,
                ),
              ),
            ),
            child: Observer(
              builder: (_) {
                // Check if we have an engine before rendering
                if (!widget.videoCallStore.isEngineInitialized) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                }

                return RemoteVideo(
                  engine: widget.videoCallStore.engine,
                  remoteUid: widget.videoCallStore.remoteUid,
                  channelName: widget.videoCallStore.channelName,
                );
              },
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Observer(
                        builder: (_) => Text(
                          'Room: ${widget.videoCallStore.channelName}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            shadows: [
                              Shadow(color: Colors.black, blurRadius: 2)
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.copy, color: Colors.white),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(
                              text: widget.videoCallStore.channelName));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Channel name copied!')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Observer(
                    builder: (_) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ControlButton(
                          icon: widget.videoCallStore.isMuted
                              ? Icons.mic_off
                              : Icons.mic,
                          color: widget.videoCallStore.isMuted
                              ? Colors.red
                              : Colors.white,
                          onPressed: widget.videoCallStore.toggleMute,
                        ),
                        ControlButton(
                          icon: Icons.call_end,
                          color: Colors.red,
                          onPressed: () => Navigator.pop(context),
                          size: 36,
                        ),
                        ControlButton(
                          icon: widget.videoCallStore.isVideoMuted
                              ? Icons.videocam_off
                              : Icons.videocam,
                          color: widget.videoCallStore.isVideoMuted
                              ? Colors.red
                              : Colors.white,
                          onPressed: widget.videoCallStore.toggleVideo,
                        ),
                        ControlButton(
                          icon: Icons.switch_camera,
                          color: Colors.white,
                          onPressed: widget.videoCallStore.switchCamera,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              width: 120,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Observer(
                  builder: (_) {
                    if (!widget.videoCallStore.isEngineInitialized) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }

                    return widget.videoCallStore.localUserJoined
                        ? AgoraVideoView(
                            controller: VideoViewController(
                              rtcEngine: widget.videoCallStore.engine,
                              canvas: const VideoCanvas(uid: 0),
                            ),
                          )
                        : const Center(
                            child:
                                CircularProgressIndicator(color: Colors.white));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
