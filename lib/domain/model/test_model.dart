
class TestModel {
  String? accessToken;
  User? user;

  TestModel({this.accessToken, this.user});

  TestModel.fromJson(Map<String, dynamic> json) {
    if(json["accessToken"] is String) {
      accessToken = json["accessToken"];
    }
    if(json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["accessToken"] = accessToken;
    if(user != null) {
      _data["user"] = user?.toJson();
    }
    return _data;
  }
}

class User {
  int? point;
  bool? enableFcm;
  String? country;
  String? zipCode;
  String? role;
  String? id;
  bool? verified;
  String? fullName;
  List<Avatar>? avatar;
  String? email;
  String? phone;
  List<dynamic>? fcmTopic;
  String? createdAt;
  String? updatedAt;
  LevelMember? levelMember;

  User({this.point, this.enableFcm, this.country, this.zipCode, this.role, this.id, this.verified, this.fullName, this.avatar, this.email, this.phone, this.fcmTopic, this.createdAt, this.updatedAt, this.levelMember});

  User.fromJson(Map<String, dynamic> json) {
    if(json["point"] is int) {
      point = json["point"];
    }
    if(json["enableFCM"] is bool) {
      enableFcm = json["enableFCM"];
    }
    if(json["country"] is String) {
      country = json["country"];
    }
    if(json["zipCode"] is String) {
      zipCode = json["zipCode"];
    }
    if(json["role"] is String) {
      role = json["role"];
    }
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["verified"] is bool) {
      verified = json["verified"];
    }
    if(json["fullName"] is String) {
      fullName = json["fullName"];
    }
    if(json["avatar"] is List) {
      avatar = json["avatar"] == null ? null : (json["avatar"] as List).map((e) => Avatar.fromJson(e)).toList();
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["phone"] is String) {
      phone = json["phone"];
    }
    if(json["fcmTopic"] is List) {
      fcmTopic = json["fcmTopic"] ?? [];
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["levelMember"] is Map) {
      levelMember = json["levelMember"] == null ? null : LevelMember.fromJson(json["levelMember"]);
    }
    if(json["id"] is String) {
      id = json["id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["point"] = point;
    _data["enableFCM"] = enableFcm;
    _data["country"] = country;
    _data["zipCode"] = zipCode;
    _data["role"] = role;
    _data["_id"] = id;
    _data["verified"] = verified;
    _data["fullName"] = fullName;
    if(avatar != null) {
      _data["avatar"] = avatar?.map((e) => e.toJson()).toList();
    }
    _data["email"] = email;
    _data["phone"] = phone;
    if(fcmTopic != null) {
      _data["fcmTopic"] = fcmTopic;
    }
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    if(levelMember != null) {
      _data["levelMember"] = levelMember?.toJson();
    }
    _data["id"] = id;
    return _data;
  }
}

class LevelMember {
  bool? isCommunityDevelopment;
  String? nameConst;
  List<String>? ownedBy;
  String? id;
  String? name;
  int? requiredStock;
  List<CommissionCashPercentProduct>? commissionCashPercentProduct;
  List<dynamic>? commissionReservePercentProduct;
  List<CommissionCashPercentStock>? commissionCashPercentStock;
  List<CommissionReservePercentStock>? commissionReservePercentStock;
  String? createdAt;
  String? updatedAt;
  int? level;

  LevelMember({this.isCommunityDevelopment, this.nameConst, this.ownedBy, this.id, this.name, this.requiredStock, this.commissionCashPercentProduct, this.commissionReservePercentProduct, this.commissionCashPercentStock, this.commissionReservePercentStock, this.createdAt, this.updatedAt, this.level});

  LevelMember.fromJson(Map<String, dynamic> json) {
    if(json["isCommunityDevelopment"] is bool) {
      isCommunityDevelopment = json["isCommunityDevelopment"];
    }
    if(json["nameConst"] is String) {
      nameConst = json["nameConst"];
    }
    if(json["ownedBy"] is List) {
      ownedBy = json["ownedBy"] == null ? null : List<String>.from(json["ownedBy"]);
    }
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["requiredStock"] is int) {
      requiredStock = json["requiredStock"];
    }
    if(json["commissionCashPercentProduct"] is List) {
      commissionCashPercentProduct = json["commissionCashPercentProduct"] == null ? null : (json["commissionCashPercentProduct"] as List).map((e) => CommissionCashPercentProduct.fromJson(e)).toList();
    }
    if(json["commissionReservePercentProduct"] is List) {
      commissionReservePercentProduct = json["commissionReservePercentProduct"] ?? [];
    }
    if(json["commissionCashPercentStock"] is List) {
      commissionCashPercentStock = json["commissionCashPercentStock"] == null ? null : (json["commissionCashPercentStock"] as List).map((e) => CommissionCashPercentStock.fromJson(e)).toList();
    }
    if(json["commissionReservePercentStock"] is List) {
      commissionReservePercentStock = json["commissionReservePercentStock"] == null ? null : (json["commissionReservePercentStock"] as List).map((e) => CommissionReservePercentStock.fromJson(e)).toList();
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["level"] is int) {
      level = json["level"];
    }
    if(json["id"] is String) {
      id = json["id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["isCommunityDevelopment"] = isCommunityDevelopment;
    _data["nameConst"] = nameConst;
    if(ownedBy != null) {
      _data["ownedBy"] = ownedBy;
    }
    _data["_id"] = id;
    _data["name"] = name;
    _data["requiredStock"] = requiredStock;
    if(commissionCashPercentProduct != null) {
      _data["commissionCashPercentProduct"] = commissionCashPercentProduct?.map((e) => e.toJson()).toList();
    }
    if(commissionReservePercentProduct != null) {
      _data["commissionReservePercentProduct"] = commissionReservePercentProduct;
    }
    if(commissionCashPercentStock != null) {
      _data["commissionCashPercentStock"] = commissionCashPercentStock?.map((e) => e.toJson()).toList();
    }
    if(commissionReservePercentStock != null) {
      _data["commissionReservePercentStock"] = commissionReservePercentStock?.map((e) => e.toJson()).toList();
    }
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["level"] = level;
    _data["id"] = id;
    return _data;
  }
}

class CommissionReservePercentStock {
  String? levelReferral;
  int? percent;

  CommissionReservePercentStock({this.levelReferral, this.percent});

  CommissionReservePercentStock.fromJson(Map<String, dynamic> json) {
    if(json["levelReferral"] is String) {
      levelReferral = json["levelReferral"];
    }
    if(json["percent"] is int) {
      percent = json["percent"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["levelReferral"] = levelReferral;
    _data["percent"] = percent;
    return _data;
  }
}

class CommissionCashPercentStock {
  String? levelReferral;
  int? percent;

  CommissionCashPercentStock({this.levelReferral, this.percent});

  CommissionCashPercentStock.fromJson(Map<String, dynamic> json) {
    if(json["levelReferral"] is String) {
      levelReferral = json["levelReferral"];
    }
    if(json["percent"] is int) {
      percent = json["percent"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["levelReferral"] = levelReferral;
    _data["percent"] = percent;
    return _data;
  }
}

class CommissionCashPercentProduct {
  String? productType;
  String? levelReferral;
  int? percent;

  CommissionCashPercentProduct({this.productType, this.levelReferral, this.percent});

  CommissionCashPercentProduct.fromJson(Map<String, dynamic> json) {
    if(json["productType"] is String) {
      productType = json["productType"];
    }
    if(json["levelReferral"] is String) {
      levelReferral = json["levelReferral"];
    }
    if(json["percent"] is int) {
      percent = json["percent"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["productType"] = productType;
    _data["levelReferral"] = levelReferral;
    _data["percent"] = percent;
    return _data;
  }
}

class Avatar {
  File? file;

  Avatar({this.file});

  Avatar.fromJson(Map<String, dynamic> json) {
    if(json["file"] is Map) {
      file = json["file"] == null ? null : File.fromJson(json["file"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(file != null) {
      _data["file"] = file?.toJson();
    }
    return _data;
  }
}

class File {
  bool? defaultAvatar;
  String? storage;
  List<String>? ownedBy;
  String? id;
  String? type;
  List<String>? file;
  int? size;
  String? name;
  String? createdAt;
  String? updatedAt;

  File({this.defaultAvatar, this.storage, this.ownedBy, this.id, this.type, this.file, this.size, this.name, this.createdAt, this.updatedAt});

  File.fromJson(Map<String, dynamic> json) {
    if(json["defaultAvatar"] is bool) {
      defaultAvatar = json["defaultAvatar"];
    }
    if(json["storage"] is String) {
      storage = json["storage"];
    }
    if(json["ownedBy"] is List) {
      ownedBy = json["ownedBy"] == null ? null : List<String>.from(json["ownedBy"]);
    }
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["type"] is String) {
      type = json["type"];
    }
    if(json["file"] is List) {
      file = json["file"] == null ? null : List<String>.from(json["file"]);
    }
    if(json["size"] is int) {
      size = json["size"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["id"] is String) {
      id = json["id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["defaultAvatar"] = defaultAvatar;
    _data["storage"] = storage;
    if(ownedBy != null) {
      _data["ownedBy"] = ownedBy;
    }
    _data["_id"] = id;
    _data["type"] = type;
    if(file != null) {
      _data["file"] = file;
    }
    _data["size"] = size;
    _data["name"] = name;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["id"] = id;
    return _data;
  }
}