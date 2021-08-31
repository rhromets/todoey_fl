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
                onPressed: () {},
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  _category.name = _categoryName.text;
                  _category.description = _categoryDescription.text;
                  await _categoryService.saveCategory(_category);
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
      body: Center(
        child: Text('Categories Screen!'),
      ),
    );
  }
}
