class SampahModel {
  int? id;
  String? sampahProductId;
  String? bankSampahId;
  String? satuanId;
  String? hargaSetor;
  String? qty;
  String? status;
  String? createdAt;
  String? updatedAt;
  Product? product;
  Satuan? satuan;

  SampahModel(
      {this.id,
      this.sampahProductId,
      this.bankSampahId,
      this.satuanId,
      this.hargaSetor,
      this.qty,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.product,
      this.satuan});

  SampahModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sampahProductId = json['sampah_product_id'];
    bankSampahId = json['bank_sampah_id'];
    satuanId = json['satuan_id'];
    hargaSetor = json['harga_setor'];
    qty = json['qty'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    satuan =
        json['satuan'] != null ? new Satuan.fromJson(json['satuan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sampah_product_id'] = this.sampahProductId;
    data['bank_sampah_id'] = this.bankSampahId;
    data['satuan_id'] = this.satuanId;
    data['harga_setor'] = this.hargaSetor;
    data['qty'] = this.qty;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.satuan != null) {
      data['satuan'] = this.satuan!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? offTakerId;
  String? jenisId;
  Null? subJenisId;
  String? satuanId;
  String? namaSampah;
  String? hargaJual;
  String? qty;
  String? status;
  Null? images;
  String? createdAt;
  String? updatedAt;
  Jenis? jenis;
  Null? subJenis;

  Product(
      {this.id,
      this.offTakerId,
      this.jenisId,
      this.subJenisId,
      this.satuanId,
      this.namaSampah,
      this.hargaJual,
      this.qty,
      this.status,
      this.images,
      this.createdAt,
      this.updatedAt,
      this.jenis,
      this.subJenis});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    offTakerId = json['off_taker_id'];
    jenisId = json['jenis_id'];
    subJenisId = json['sub_jenis_id'];
    satuanId = json['satuan_id'];
    namaSampah = json['nama_sampah'];
    hargaJual = json['harga_jual'];
    qty = json['qty'];
    status = json['status'];
    images = json['images'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    jenis = json['jenis'] != null ? new Jenis.fromJson(json['jenis']) : null;
    subJenis = json['sub_jenis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['off_taker_id'] = this.offTakerId;
    data['jenis_id'] = this.jenisId;
    data['sub_jenis_id'] = this.subJenisId;
    data['satuan_id'] = this.satuanId;
    data['nama_sampah'] = this.namaSampah;
    data['harga_jual'] = this.hargaJual;
    data['qty'] = this.qty;
    data['status'] = this.status;
    data['images'] = this.images;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.jenis != null) {
      data['jenis'] = this.jenis!.toJson();
    }
    data['sub_jenis'] = this.subJenis;
    return data;
  }
}

class Jenis {
  int? id;
  String? jenis;
  String? status;
  String? createdAt;
  String? updatedAt;

  Jenis({this.id, this.jenis, this.status, this.createdAt, this.updatedAt});

  Jenis.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jenis = json['jenis'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['jenis'] = this.jenis;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Satuan {
  int? id;
  String? satuan;
  Null? converter;
  String? createdAt;
  String? updatedAt;

  Satuan(
      {this.id, this.satuan, this.converter, this.createdAt, this.updatedAt});

  Satuan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    satuan = json['satuan'];
    converter = json['converter'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['satuan'] = this.satuan;
    data['converter'] = this.converter;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
