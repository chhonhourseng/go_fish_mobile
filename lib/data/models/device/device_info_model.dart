// ignore_for_file: public_member_api_docs, sort_constructors_first

class DeviceInfoModel {
  String? name;
  String? deviceId;
  String? version;
  String? deviceOs;
  String? deviceToken;
  String? osName;
  String? fcmToken;
  String? uid; //device id from backend
  String? id; //document id

  DeviceInfoModel({
    this.name,
    this.deviceId,
    this.version,
    this.deviceOs,
    this.deviceToken,
    this.osName,
    this.fcmToken,
    this.uid,
    this.id,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "device_name": name,
      "device_uid": deviceId,
    };
  }
}
