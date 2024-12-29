// ignore_for_file: prefer_const_constructors

class Item {
    final String name;
    final int amount;
    final String description;

    Item({
        required this.name,
        required this.amount,
        required this.description,
    });

    factory Item.fromJson(Map<String, dynamic> json) {
        return Item(
            name: json['name'],
            amount: json['amount'],
            description: json['description'],
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'name': name,
            'amount': amount,
            'description': description,
        };
    }
}