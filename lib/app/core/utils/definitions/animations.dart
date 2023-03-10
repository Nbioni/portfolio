class AvatarAnimations {
  static AvatarAnimation idle1 = AvatarAnimation("idle1", 11190);
  static AvatarAnimation idle2 = AvatarAnimation("idle2", 2260);
  static AvatarAnimation idle3 = AvatarAnimation("idle3", 4140);
  static AvatarAnimation idle4 = AvatarAnimation("idle4", 3110);
  static AvatarAnimation idle5 = AvatarAnimation("idle5", 13150);
  static AvatarAnimation jumping = AvatarAnimation("jumping", 1280);
  static AvatarAnimation longTimeStanding =
      AvatarAnimation("long-time-standing", 10180);
  static AvatarAnimation looking = AvatarAnimation("looking", 5060);
  static AvatarAnimation mouseOnBottom =
      AvatarAnimation("mouse-on-bottom", 6120);
  static AvatarAnimation sendingAMessage =
      AvatarAnimation("sending-a-message", 23180);
  static AvatarAnimation showingSkills =
      AvatarAnimation("showing-skills", 3130);
  static AvatarAnimation talkingOnPhone =
      AvatarAnimation("talking-on-phone", 37070);
  static AvatarAnimation tappingTeMouse =
      AvatarAnimation("tapping-the-mouse", 2010);
}

class AvatarAnimation {
  final String name;
  final int milliseconds;
  AvatarAnimation(this.name, this.milliseconds);
}
