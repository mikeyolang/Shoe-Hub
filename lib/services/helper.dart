// This class is use to retrieve the data from the json file

// It fetches the data from the json file and returns a list of sneakers

import 'package:flutter/services.dart' as the_bundle;
import 'package:shoehub/models/sneaker_model.dart';

class SneakerService {
  // For the Male sneakers
  Future<Sneakers> getMaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/data/men_shoes.json");

    final maleList = sneakersFromJson(data);
    return maleList;
  }

// For the female sneakers
  Future<Sneakers> getFemaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/data/women_shoes.json");
    final femaleList = sneakersFromJson(data);

    return femaleList;
  }

  // For the kids sneakers
  Future<Sneakers> getKidsSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/data/kid_shoes.json");
    final kidsList = sneakersFromJson(data);

    return kidsList;
  }

  // Get male sneakers by id
  Future <Sneakers> getMaleSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/data/men_shoes.json");
    final manList = sneakersFromJson(data);
    final maleSneakers = manList.firstWhere((element) => element.id == id);
    return maleSneakers;
  }
}
