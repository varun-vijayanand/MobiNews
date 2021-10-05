import 'package:updt/models/categorymodel.dart';

List<CategoryModel> getCategories() {
  // ignore: deprecated_member_use
  List<CategoryModel> category = [];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.CategoryName = "Business";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "Entertainment";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1499364615650-ec38552f4f34?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=666&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "Health";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=794&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "Sports";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3BvcnRzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "Technology";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1518770660439-4636190af475?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
  category.add(categoryModel);

  return category;
  
}