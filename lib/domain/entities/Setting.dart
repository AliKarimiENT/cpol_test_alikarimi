class Setting {
  Setting({
    num? fileUploadLimit,
    num? soundUploadLimit,
    num? videoUploadLimit,
    num? imageUploadLimit,
    num? messageCharLimit,}){
    _fileUploadLimit = fileUploadLimit;
    _soundUploadLimit = soundUploadLimit;
    _videoUploadLimit = videoUploadLimit;
    _imageUploadLimit = imageUploadLimit;
    _messageCharLimit = messageCharLimit;
  }

  Setting.fromJson(dynamic json) {
    _fileUploadLimit = json['file_upload_limit'];
    _soundUploadLimit = json['sound_upload_limit'];
    _videoUploadLimit = json['video_upload_limit'];
    _imageUploadLimit = json['image_upload_limit'];
    _messageCharLimit = json['message_char_limit'];
  }
  num? _fileUploadLimit;
  num? _soundUploadLimit;
  num? _videoUploadLimit;
  num? _imageUploadLimit;
  num? _messageCharLimit;
  Setting copyWith({  num? fileUploadLimit,
    num? soundUploadLimit,
    num? videoUploadLimit,
    num? imageUploadLimit,
    num? messageCharLimit,
  }) => Setting(  fileUploadLimit: fileUploadLimit ?? _fileUploadLimit,
    soundUploadLimit: soundUploadLimit ?? _soundUploadLimit,
    videoUploadLimit: videoUploadLimit ?? _videoUploadLimit,
    imageUploadLimit: imageUploadLimit ?? _imageUploadLimit,
    messageCharLimit: messageCharLimit ?? _messageCharLimit,
  );
  num? get fileUploadLimit => _fileUploadLimit;
  num? get soundUploadLimit => _soundUploadLimit;
  num? get videoUploadLimit => _videoUploadLimit;
  num? get imageUploadLimit => _imageUploadLimit;
  num? get messageCharLimit => _messageCharLimit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['file_upload_limit'] = _fileUploadLimit;
    map['sound_upload_limit'] = _soundUploadLimit;
    map['video_upload_limit'] = _videoUploadLimit;
    map['image_upload_limit'] = _imageUploadLimit;
    map['message_char_limit'] = _messageCharLimit;
    return map;
  }

}
