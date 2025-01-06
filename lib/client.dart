class Client {
  final String name;
  final String visaCard;

  Client(this.name, this.visaCard);

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      json['name'] as String,
      json['visaCard'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'visaCard': visaCard,
    };
  }
}
