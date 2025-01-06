class Transact {
  final int id;
  final String model;
  final String image;
  final String clientName;
  final String visaCard;
  final double price;
  final int year;
  final DateTime date;

  Transact(this.id, this.model, this.image, this.clientName, this.visaCard,
      this.price, this.year, this.date);

  factory Transact.fromJson(Map<String, dynamic> json) {
    return Transact(
      json['id'] as int,
      json['model'] as String,
      json['image'] as String,
      json['clientName'] as String,
      json['visaCard'] as String,
      (json['price'] as num).toDouble(),
      json['year'] as int,
      DateTime.fromMillisecondsSinceEpoch(json['date'] as int),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'model': model,
      'image': image,
      'clientName': clientName,
      'visaCard': visaCard,
      'price': price,
      'date': date.millisecondsSinceEpoch,
      'year': year,
    };
  }
}
