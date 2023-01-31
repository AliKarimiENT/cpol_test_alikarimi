class Setting {
  Setting({
      this.fileUploadLimit, 
      this.soundUploadLimit, 
      this.videoUploadLimit, 
      this.imageUploadLimit, 
      this.messageCharLimit,});

  Setting.fromJson(dynamic json) {
    fileUploadLimit = json['file_upload_limit'];
    soundUploadLimit = json['sound_upload_limit'];
    videoUploadLimit = json['video_upload_limit'];
    imageUploadLimit = json['image_upload_limit'];
    messageCharLimit = json['message_char_limit'];
  }
  int fileUploadLimit;
  int soundUploadLimit;
  int videoUploadLimit;
  int imageUploadLimit;
  int messageCharLimit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['file_upload_limit'] = fileUploadLimit;
    map['sound_upload_limit'] = soundUploadLimit;
    map['video_upload_limit'] = videoUploadLimit;
    map['image_upload_limit'] = imageUploadLimit;
    map['message_char_limit'] = messageCharLimit;
    return map;
  }

}