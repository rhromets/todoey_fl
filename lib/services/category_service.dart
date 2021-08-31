import 'package:todoey_flutter/models/category.dart';
import 'package:todoey_flutter/repositories/repository.dart';

class CategoryService {
  late Repository _repository;
  CategoryService() {
    _repository = Repository();
  }
  saveCategory(Category category) async {
    return await _repository.save('categories', category.categoryMap());
  }
}
