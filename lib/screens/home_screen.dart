import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterrecipe/common_widgets/appbar_tiitle.dart';
import 'package:flutterrecipe/common_widgets/category_tile.dart';
import 'package:flutterrecipe/common_widgets/recipe_tile.dart';
import 'package:flutterrecipe/helpers/data.dart';
import 'package:flutterrecipe/helpers/dynamic_theme.dart';
import 'package:flutterrecipe/helpers/recipe.dart';
import 'package:flutterrecipe/model/category_model.dart';
import 'package:flutterrecipe/model/recipe_model.dart';
import 'package:flutterrecipe/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categoryList = List<CategoryModel>();
  List<RecipeModel> recipeList = List<RecipeModel>();

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categoryList = getCategories();
    getRecipes();
  }

  getRecipes() async {
    Recipe recipe = Recipe();
    await recipe.getRecipes();
    recipeList = recipe.recipes;
    setState(() {
      _loading = false;
    });
  }

  Widget _buildInputField() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () => SearchScreen.show(context),
        child: Container(
          height: 45.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.grey[500], width: 1.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.search, color: Colors.grey[500]),
              SizedBox(width: 8.0),
              Text(
                'Search by food ingredient',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to switch the theme.
  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
      Theme.of(context).brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white, ~dynamic
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: AppBarTitle(),

        // Theme changer Switch
        actions: [
          IconButton(
            icon: Icon(
              isThemeDark(context) ? Icons.wb_sunny : Icons.brightness_2,
              color: isThemeDark(context) ? Colors.white : Colors.black,
            ),
            onPressed: () => changeBrightness(),
          )
        ],
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInputField(),
          Container(
            height: 100.0,
            margin: EdgeInsets.only(left: 12.0, top: 10.0),
            child: ListView.builder(
              physics: ScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              itemCount: categoryList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CategoryTile(
                  imageUrl: categoryList[index].imageUrl,
                  title: categoryList[index].categoryName,
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "Today's Special Dishes",
              style: TextStyle(
                fontSize: 18.0,
                //color: Colors.black, ~dynamic
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 25.0),
            child: _loading == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : StaggeredGridView.countBuilder(
                    physics: ScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    itemCount: recipeList.length,
                    itemBuilder: (context, index) {
                      return RecipeTile(
                        imageUrl: recipeList[index].image,
                        recipeName: recipeList[index].label,
                        recipeSource: recipeList[index].source,
                      );
                    },
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.fit(2),
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                  ),
          ),
        ],
      ),
    );
  }
}
