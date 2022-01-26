/// products : [{"product_name":"Half Sleeve Cotton T-shirt (JMT-0057)","description":"It's simple shirt","price":[{"color_size":"whitesmall","price":500.0},{"color_size":"whitelarge","price":600.0},{"color_size":"blacksmall","price":400.0},{"color_size":"blacklarge","price":550.0}],"total_item":100,"color":["white","black"],"size":["small","large"],"thumbnail":"http://sumon.himalayacloud.com/uploads/thumnail/gallery_big/08172021184403thumnail.jpeg","image":["http://sumon.himalayacloud.com/uploads/thumnail/gallery_big/08172021184403thumnail.jpeg"]},{"product_name":"Cool Colors Combination Hoodie For Men","description":"It's simple T-shirt","price":[{"color_size":"whitesmall","price":100.0},{"color_size":"whitelarge","price":200.0},{"color_size":"blacksmall","price":100.0},{"color_size":"blacklarge","price":250.0}],"total_item":100,"color":["white","black"],"size":["small","large"],"thumbnail":"http://sumon.himalayacloud.com/uploads/thumnail/gallery_big/12092020155411thumnail.jpg","image":["http://sumon.himalayacloud.com/uploads/thumnail/gallery_big/12092020155411thumnail.jpg","http://sumon.himalayacloud.com/uploads/galleryImage/zoom/18911182020174757gi.jpg"]}]

class ProductsResponse {
  ProductsResponse({
      List<Products>? products,}){
    _products = products;
}

  ProductsResponse.fromJson(dynamic json) {
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  List<Products>? _products;

  List<Products>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// product_name : "Half Sleeve Cotton T-shirt (JMT-0057)"
/// description : "It's simple shirt"
/// price : [{"color_size":"whitesmall","price":500.0},{"color_size":"whitelarge","price":600.0},{"color_size":"blacksmall","price":400.0},{"color_size":"blacklarge","price":550.0}]
/// total_item : 100
/// color : ["white","black"]
/// size : ["small","large"]
/// thumbnail : "http://sumon.himalayacloud.com/uploads/thumnail/gallery_big/08172021184403thumnail.jpeg"
/// image : ["http://sumon.himalayacloud.com/uploads/thumnail/gallery_big/08172021184403thumnail.jpeg"]

class Products {
  Products({
      String? productName, 
      String? description, 
      List<Price>? price, 
      int? totalItem, 
      List<String>? color, 
      List<String>? size, 
      String? thumbnail, 
      List<String>? image,}){
    _productName = productName;
    _description = description;
    _price = price;
    _totalItem = totalItem;
    _color = color;
    _size = size;
    _thumbnail = thumbnail;
    _image = image;
}

  Products.fromJson(dynamic json) {
    _productName = json['product_name'];
    _description = json['description'];
    if (json['price'] != null) {
      _price = [];
      json['price'].forEach((v) {
        _price?.add(Price.fromJson(v));
      });
    }
    _totalItem = json['total_item'];
    _color = json['color'] != null ? json['color'].cast<String>() : [];
    _size = json['size'] != null ? json['size'].cast<String>() : [];
    _thumbnail = json['thumbnail'];
    _image = json['image'] != null ? json['image'].cast<String>() : [];
  }
  String? _productName;
  String? _description;
  List<Price>? _price;
  int? _totalItem;
  List<String>? _color;
  List<String>? _size;
  String? _thumbnail;
  List<String>? _image;

  String? get productName => _productName;
  String? get description => _description;
  List<Price>? get price => _price;
  int? get totalItem => _totalItem;
  List<String>? get color => _color;
  List<String>? get size => _size;
  String? get thumbnail => _thumbnail;
  List<String>? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_name'] = _productName;
    map['description'] = _description;
    if (_price != null) {
      map['price'] = _price?.map((v) => v.toJson()).toList();
    }
    map['total_item'] = _totalItem;
    map['color'] = _color;
    map['size'] = _size;
    map['thumbnail'] = _thumbnail;
    map['image'] = _image;
    return map;
  }

}

/// color_size : "whitesmall"
/// price : 500.0

class Price {
  Price({
      String? colorSize, 
      double? price,}){
    _colorSize = colorSize;
    _price = price;
}

  Price.fromJson(dynamic json) {
    _colorSize = json['color_size'];
    _price = json['price'];
  }
  String? _colorSize;
  double? _price;

  String? get colorSize => _colorSize;
  double? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['color_size'] = _colorSize;
    map['price'] = _price;
    return map;
  }

}