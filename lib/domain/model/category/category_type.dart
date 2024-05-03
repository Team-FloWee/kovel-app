import 'package:kovel_app/domain/model/category/category.dart';

abstract class CategoryType extends Category {
  CategoryType({required super.id});

  @override
  String get name;
}