class TestProducts {
  String? status;
  int? code;
  String? locale;
  Null seed;
  int? total;
  List<Data>? data;

  TestProducts(
      {this.status, this.code, this.locale, this.seed, this.total, this.data});

  TestProducts.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    locale = json['locale'];
    seed = json['seed'];
    total = json['total'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['locale'] = locale;
    data['seed'] = seed;
    data['total'] = total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  String? ean;
  String? upc;
  String? image;
  List<Images>? images;
  double? netPrice;
  int? taxes;
  double? price;
  List<int>? categories;
  List<String>? tags;

  Data(
      {this.id,
      this.name,
      this.description,
      this.ean,
      this.upc,
      this.image,
      this.images,
      this.netPrice,
      this.taxes,
      this.price,
      this.categories,
      this.tags});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    ean = json['ean'];
    upc = json['upc'];
    image = json['image'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    netPrice = json['net_price'];
    taxes = json['taxes'];
    price = json['price'];
    categories = json['categories'].cast<int>();
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['ean'] = ean;
    data['upc'] = upc;
    data['image'] = image;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['net_price'] = netPrice;
    data['taxes'] = taxes;
    data['price'] = price;
    data['categories'] = categories;
    data['tags'] = tags;
    return data;
  }
}

class Images {
  String? title;
  String? description;
  String? url;

  Images({this.title, this.description, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    return data;
  }
}
