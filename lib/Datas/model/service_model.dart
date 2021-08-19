import 'dart:convert';

import 'package:flutter/material.dart';

class Service {
  final String id;
  final String name;
  final String unit;
  final String urlImage;
  final String description;
  final int price;
  final String team;

  Service({
    @required this.id,
    this.name,
    this.unit,
    this.urlImage,
    this.description,
    this.price,
    this.team,
  });

  Service copyWith({
    String id,
    String name,
    String unit,
    String urlImage,
    String description,
    double price,
    String team,
  }) {
    return Service(
      id: id ?? this.id,
      name: name ?? this.name,
      unit: unit ?? this.unit,
      urlImage: urlImage ?? this.urlImage,
      description: description ?? this.description,
      price: price ?? this.price,
      team: team ?? this.team,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'unit': unit,
      'urlImage': urlImage,
      'description': description,
      'price': price,
      'team': team,
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Service(
      id: map['id'],
      name: map['name'],
      unit: map['unit'],
      urlImage: map['urlImage'],
      description: map['description'],
      price: map['price'],
      team: map['team'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) =>
      Service.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Service(id: $id, name: $name, unit: $unit, urlImage: $urlImage, description: $description, price: $price, team: $team)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Service &&
        o.id == id &&
        o.name == name &&
        o.unit == unit &&
        o.urlImage == urlImage &&
        o.description == description &&
        o.price == price &&
        o.team == team;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        unit.hashCode ^
        urlImage.hashCode ^
        description.hashCode ^
        price.hashCode ^
        team.hashCode;
  }
}
