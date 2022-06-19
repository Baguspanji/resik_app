class HistoryWidrawModel {
  int? id;
  String? nasabahId;
  String? bankSampahId;
  String? jumlah;
  String? pulledAt;
  String? status;
  String? createdAt;
  String? updatedAt;

  HistoryWidrawModel(
      {this.id,
      this.nasabahId,
      this.bankSampahId,
      this.jumlah,
      this.pulledAt,
      this.status,
      this.createdAt,
      this.updatedAt});

  HistoryWidrawModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nasabahId = json['nasabah_id'];
    bankSampahId = json['bank_sampah_id'];
    jumlah = json['jumlah'];
    pulledAt = json['pulled_at'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nasabah_id'] = this.nasabahId;
    data['bank_sampah_id'] = this.bankSampahId;
    data['jumlah'] = this.jumlah;
    data['pulled_at'] = this.pulledAt;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
