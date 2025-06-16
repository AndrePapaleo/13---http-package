import 'dart:convert';

// Função para converter a lista de usuários do corpo da resposta
List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

// Classe do Modelo User
class User {
    final int id;
    final String name;
    final String username;
    final String email;
    final Address address;
    final Company company;

    User({
        required this.id,
        required this.name,
        required this.username,
        required this.email,
        required this.address,
        required this.company,
    });

    // Construtor factory para criar um User a partir de um JSON
    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: Address.fromJson(json["address"]),
        company: Company.fromJson(json["company"]),
    );
}

// Classe do Modelo Address
class Address {
    final String street;
    final String city;

    Address({
        required this.street,
        required this.city,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        city: json["city"],
    );
}

// Classe do Modelo Company
class Company {
    final String name;

    Company({
        required this.name,
    });

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
    );
}
