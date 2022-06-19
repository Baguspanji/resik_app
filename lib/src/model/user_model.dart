class UserModel {
  int? id;
  String? bankSampahId;
  String? username;
  String? nama;
  Null? email;
  Null? latitude;
  Null? longitude;
  String? status;
  String? noTelp;
  String? saldo;
  Null? image;
  Null? images;
  String? createdAt;
  String? updatedAt;
  BankSampah? bankSampah;

  UserModel(
      {this.id,
      this.bankSampahId,
      this.username,
      this.nama,
      this.email,
      this.latitude,
      this.longitude,
      this.status,
      this.noTelp,
      this.saldo,
      this.image,
      this.images,
      this.createdAt,
      this.updatedAt,
      this.bankSampah});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankSampahId = json['bank_sampah_id'];
    username = json['username'];
    nama = json['nama'];
    email = json['email'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    status = json['status'];
    noTelp = json['no_telp'];
    saldo = json['saldo'];
    image = json['image'];
    images = json['images'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    bankSampah = json['bank_sampah'] != null
        ? new BankSampah.fromJson(json['bank_sampah'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bank_sampah_id'] = this.bankSampahId;
    data['username'] = this.username;
    data['nama'] = this.nama;
    data['email'] = this.email;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['status'] = this.status;
    data['no_telp'] = this.noTelp;
    data['saldo'] = this.saldo;
    data['image'] = this.image;
    data['images'] = this.images;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.bankSampah != null) {
      data['bank_sampah'] = this.bankSampah!.toJson();
    }
    return data;
  }
}

class BankSampah {
  int? id;
  String? userId;
  String? nama;
  String? alamat;
  String? noTelp;
  Null? latitude;
  Null? longitude;
  String? createdAt;
  String? updatedAt;

  BankSampah(
      {this.id,
      this.userId,
      this.nama,
      this.alamat,
      this.noTelp,
      this.latitude,
      this.longitude,
      this.createdAt,
      this.updatedAt});

  BankSampah.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    nama = json['nama'];
    alamat = json['alamat'];
    noTelp = json['no_telp'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['nama'] = this.nama;
    data['alamat'] = this.alamat;
    data['no_telp'] = this.noTelp;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
