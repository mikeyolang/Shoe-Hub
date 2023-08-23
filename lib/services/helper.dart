// This class is use to retrieve the data from the json file

// It fetches the data from the json file and returns a list of sneakers

import 'dart:async';

import 'package:flutter/services.dart' as the_bundle;
import 'package:shoehub/models/sneaker_model.dart';

class SneakerService {
  // For the Male sneakers
  Future<List<Sneakers>> getMaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/data/men_shoes.json");

    final maleList = sneakersFromJson(data);
    return Future.value(maleList as FutureOr<List<Sneakers>>?);
  }

// For the female sneakers
  Future<List<Sneakers>> getFemaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/data/women_shoes.json");
    final femaleList = sneakersFromJson(data);

    return Future.value(femaleList as FutureOr<List<Sneakers>>?);
  }

  // For the kids sneakers
  Future<List<Sneakers>> getKidsSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/data/kid_shoes.json");
    final kidsList = sneakersFromJson(data);

    return Future.value(kidsList as FutureOr<List<Sneakers>>?);
  }

  // Get male sneakers by id
  Future<Sneakers> getMaleSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/data/men_shoes.json");
    final manList = sneakersFromJson(data);
    final maleSneakers = manList.firstWhere((element) => element.id == id);
    return maleSneakers;
  }

  Future<Sneakers> getFemaleSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/data/female_shoes.json");
    final womanList = sneakersFromJson(data);
    final femaleSneakers = womanList.firstWhere((element) => element.id == id);
    return femaleSneakers;
  }

  Future<Sneakers> getKidSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/data/men_shoes.json");
    final kidList = sneakersFromJson(data);
    final kidSneakers = kidList.firstWhere((element) => element.id == id);
    return kidSneakers;
  }
}
