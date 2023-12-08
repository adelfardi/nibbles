import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/application/blocs/meals/meals_bloc.dart';
import 'package:nibbles_ecommerce/configs/app_dimensions.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/models/meal_category.dart';
import 'package:nibbles_ecommerce/repositories/meals_repos/meal_repo.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key, required this.mealCategory});

  final MealCategory mealCategory;

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  @override
  void initState() {
    //  context.read<MealsBloc>().add(LoadMeals());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealsBloc(
        mealsRepo: MealsRepo(),
        categoryId: widget.mealCategory.categoryid,
      )..add(
          LoadMeals(),
        ),
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  AppAssets.mealsByCat,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    color: AppColors.transparentColor.withOpacity(.24),
                    height: AppDimensions.normalize(19),
                    width: MediaQuery.sizeOf(context).width,
                    padding: EdgeInsets.only(left: AppDimensions.normalize(8)),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: AppDimensions.normalize(12),
                          color: Colors.white,
                        )),
                  ),
                )
              ],
            ),
            BlocBuilder<MealsBloc, MealsState>(
              builder: (context, state) {
                if (state is MealsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is MealsLoaded) {
                  return Center(
                    child: Text(state.meals.first.description),
                  );
                } else {
                  return const Center(
                    child: Text("error"),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
