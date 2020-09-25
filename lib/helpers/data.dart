import 'package:flutterrecipe/model/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categoryList = new List<CategoryModel>();
  CategoryModel category = CategoryModel();

  // 1
  category.categoryName = 'Chicken';
  category.imageUrl =
      'https://images.unsplash.com/photo-1562967914-01efa7e87832?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1052&q=80';
  categoryList.add(category);

  // 2
  category = new CategoryModel();
  category.categoryName = 'Burger';
  category.imageUrl =
      'https://images.unsplash.com/photo-1571091718767-18b5b1457add?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1052&q=80';
  categoryList.add(category);

  // 3
  category = new CategoryModel();
  category.categoryName = 'Mushroom';
  category.imageUrl =
      'https://www.thespruceeats.com/thmb/18EEVs3RuMLXec-rV5hfCM2k7so=/1500x975/filters:no_upscale():max_bytes(150000):strip_icc()/how-to-saute-mushrooms-4046156-Final-5bb2402346e0fb002650f6b0.jpg';
  categoryList.add(category);

  // 4
  category = new CategoryModel();
  category.categoryName = 'Paneer';
  category.imageUrl =
      'https://images.unsplash.com/photo-1551881192-002e02ad3d87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80';
  categoryList.add(category);

  // 5
  category = new CategoryModel();
  category.categoryName = 'Mutton';
  category.imageUrl =
      'https://images.unsplash.com/photo-1574653853027-5382a3d23a15?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1052&q=80';
  categoryList.add(category);

  // 6
  category = new CategoryModel();
  category.categoryName = 'Egg';
  category.imageUrl =
      'https://images.unsplash.com/photo-1553163147-622ab57be1c7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80';
  categoryList.add(category);

  return categoryList;
}
