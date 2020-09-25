import 'dart:convert';

import 'package:flutterrecipe/keys.dart';
import 'package:flutterrecipe/model/recipe_model.dart';
import 'package:http/http.dart' as http;

class Recipe {
  List<RecipeModel> recipes = [];

  Future<void> getRecipes() async {
    String url =
        'https://api.edamam.com/search?q=dishes&app_id=$applicationId&app_key=$applicationKey&from=0&to=20&calories=750';

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['more'] == true) {
      jsonData['hits'].forEach((element) {
        if (element['recipe']['url'] != null &&
            element['recipe']['image'] != null) {
          RecipeModel recipeModel = RecipeModel(
            label: element['recipe']['label'],
            image: element['recipe']['image'],
            source: element['recipe']['source'],
          );

          recipes.add(recipeModel);
        }
      });
    }
  }
}
