import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/category.dart';
import 'package:todoey_flutter/services/category_service.dart';

class CategoriesScreen extends StatefulWidget {
  static const String id = "categories_screen";

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var _categoryName = TextEditingController();
  var _categoryDescription = TextEditingController();

  List<Category> _categoryList = [];

  var _editCategoryName = TextEditingController();

  var _editCategoryDescription = TextEditingController();

  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  getAllCategories() async {
    var categories = await _categoryService.getCategories();
    categories.forEach((category) {
      setState(() {
        var model = Category();
        model.name = category['name'];
        model.id = category['id'];
        model.description = category['description'];
        _categoryList.add(model);
      });
    });
    return _categoryList;
  }

  Category _category = Category();
  CategoryService _categoryService = CategoryService();

  _showFormInDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  _category.name = _categoryName.text;
                  _category.description = _categoryDescription.text;
                  var result = await _categoryService.saveCategory(_category);
                  if (result > 0) {
                    Navigator.pop(context);
                  }
                },
                child: Text('Save'),
              ),
            ],
            title: Text('Category form'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _categoryName,
                    decoration: InputDecoration(
                      labelText: 'Category Name',
                      hintText: 'Name',
                    ),
                  ),
                  TextField(
                    controller: _categoryDescription,
                    decoration: InputDecoration(
                      labelText: 'Category Description',
                      hintText: 'Description',
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  _editCategoryDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  _category.name = _categoryName.text;
                  _category.description = _categoryDescription.text;
                  var result = await _categoryService.saveCategory(_category);
                  print(result);
                },
                child: Text('Save'),
              ),
            ],
            title: Text('Category edit form'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _editCategoryName,
                    decoration: InputDecoration(
                      labelText: 'Category Name',
                      hintText: 'Name',
                    ),
                  ),
                  TextField(
                    controller: _editCategoryDescription,
                    decoration: InputDecoration(
                      labelText: 'Category Description',
                      hintText: 'Description',
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  _editCategory(BuildContext context, categoryId) async {
    var category = await _categoryService.getCategoryById(categoryId);
    setState(() {
      _editCategoryName.text = category[0]['name'] ?? 'No name';
      _editCategoryDescription.text =
          category[0]['description'] ?? 'No description';

      _editCategoryDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).accentColor,
          ),
        ),
        title: Text(
          'Categories',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormInDialog(context);
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).accentColor,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: _categoryList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  _editCategory(context, _categoryList[index].id);
                },
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _categoryList[index].name.toString(),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
