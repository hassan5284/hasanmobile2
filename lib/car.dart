class Car {
    final int id;
    String model;
    double price;
    String image;

    Car(this.id, this.model, this.price, this.image);

    factory Car.fromJson(Map<String, dynamic> json) {
        return Car(
            json['id'],
            json['model'],
            json['price'].toDouble(),
            json['image'],
        );
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'model': model,
        'price': price,
        'image': image,
    };
}


List<int> years = [
  2023,
  2022,
  2021,
  2020,
  2019,
  2018,
  2017,
  2016,
  2015,
  2014,
  2013,
  2012,
  2011,
  2010
];
