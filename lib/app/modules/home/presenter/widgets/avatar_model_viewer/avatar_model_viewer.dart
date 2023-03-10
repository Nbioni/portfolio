import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart' as mv;

import '../../../../../core/utils/constants/link_constants.dart';
import '../../../../../core/utils/constants/model_viewer_constants.dart';

class AvatarModelViewer extends StatelessWidget {
  const AvatarModelViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return mv.ModelViewer(
      id: modelViewerId,
      src: avatarNahalielLink,
      alt: "Nahaliel Bioni",
      cameraControls: false,
      exposure: 0.7,
      animationName: 'idle1',
      autoPlay: true,
      environmentImage: modelViewerEnvironmentImageLink,
      cameraOrbit: modelViewerCameraOrbit,
      cameraTarget: modelViewerCameraTarget,
      animationCrossfadeDuration: animationCrossfadeDuration,
      relatedJs: """
        const modelViewer = document.querySelector('#$modelViewerId');
        modelViewer.shadowIntensity = 2;
        function play(animation, reset) {
          modelViewer.animationName = animation;
          if(reset){
            modelViewer.currentTime = 0;
          }
          modelViewer.play();
        }
      """,
    );
  }
}
