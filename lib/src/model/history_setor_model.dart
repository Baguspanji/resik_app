class HistorySampahModel {
  String? id;
  String? nasabahId;
  String? bankSampahId;
  String? sampahId;
  String? kurirId;
  String? jumlah;
  String? harga;
  String? storedAt;
  String? status;
  String? createdAt;
  String? updatedAt;
  Sampah? sampah;

  HistorySampahModel(
      {this.id,
      this.nasabahId,
      this.bankSampahId,
      this.sampahId,
      this.kurirId,
      this.jumlah,
      this.harga,
      this.storedAt,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.sampah});

  HistorySampahModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nasabahId = json['nasabah_id'];
    bankSampahId = json['bank_sampah_id'];
    sampahId = json['sampah_id'];
    kurirId = json['kurir_id'];
    jumlah = json['jumlah'];
    harga = json['harga'];
    storedAt = json['stored_at'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sampah =
        json['sampah'] != null ? new Sampah.fromJson(json['sampah']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nasabah_id'] = this.nasabahId;
    data['bank_sampah_id'] = this.bankSampahId;
    data['sampah_id'] = this.sampahId;
    data['kurir_id'] = this.kurirId;
    data['jumlah'] = this.jumlah;
    data['harga'] = this.harga;
    data['stored_at'] = this.storedAt;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.sampah != null) {
      data['sampah'] = this.sampah!.toJson();
    }
    return data;
  }
}

class Sampah {
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

  Sampah(
      {this.id,
      this.sampahProductId,
      this.bankSampahId,
      this.satuanId,
      this.hargaSetor,
      this.qty,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.product});

  Sampah.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class Product {
  int? id;
  String? offTakerId;
  String? jenisId;
  String? subJenisId;
  String? satuanId;
  String? namaSampah;
  String? hargaJual;
  String? qty;
  String? status;
  String? images;
  String? createdAt;
  String? updatedAt;
  Jenis? jenis;
  String? subJenis;

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
