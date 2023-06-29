class sampah {
  List<DataSampah>? data;
  String? message;

  sampah({this.data, this.message});

  sampah.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataSampah>[];
      json['data'].forEach((v) {
        data!.add(new DataSampah.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class DataSampah {
  String? createdAt;
  String? id;
  String? plastic;
  String? glass;
  String? metal;
  String? paper;
  String? ewaste;

  DataSampah(
      {this.createdAt,
      this.id,
      this.plastic,
      this.glass,
      this.metal,
      this.paper,
      this.ewaste,});

  DataSampah.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    id = json['id'];
    plastic = json['plastic'];
    glass = json['glass'];
    metal = json['metal'];
    paper = json['paper'];
    ewaste = json['ewaste'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['plastic'] = this.plastic;
    data['glass'] = this.glass;
    data['metal'] = this.metal;
    data['paper'] = this.paper;
    data['ewaste'] = this.ewaste;
    return data;
  }
}
