import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/core/extensions/extensions.dart';
import 'package:nibbles_ecommerce/models/meal.dart';
import 'package:nibbles_ecommerce/presentation/widgets/filled_favicon_stack.dart';
import 'package:nibbles_ecommerce/presentation/widgets/meal_row.dart';
import 'package:nibbles_ecommerce/presentation/widgets/meal_top_stack.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height / .75,
              child: Stack(
                children: [
                  mealTopStack(context),
                  Positioned(
                    top: AppDimensions.normalize(79),
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: Space.hf(1.2),
                      padding: Space.all(1, 1),
                      //  height: AppDimensions.normalize(1000),
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                            AppDimensions.normalize(22),
                          ),
                          topLeft: Radius.circular(
                            AppDimensions.normalize(11),
                          ),
                          bottomLeft: Radius.circular(
                            AppDimensions.normalize(22),
                          ),
                          bottomRight: Radius.circular(
                            AppDimensions.normalize(11),
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppAssets.star,
                                colorFilter: const ColorFilter.mode(
                                    AppColors.antiqueRuby, BlendMode.srcIn),
                              ),
                              Space.xf(.4),
                              Text(
                                mealModel.rating,
                                style: AppText.h3
                                    ?.copyWith(color: AppColors.antiqueRuby),
                              )
                            ],
                          ),
                          Space.yf(.8),
                          Text(
                            mealModel.name.capitalize(),
                            style: AppText.h2,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Space.yf(.8),
                          Text(
                            "${mealModel.calories} Calories",
                            style: AppText.h3
                                ?.copyWith(color: AppColors.antiqueRuby),
                          ),
                          Space.yf(.2),
                          Wrap(
                            children: [
                              ...mealModel.facts.map(
                                (fact) => Container(
                                  width: AppDimensions.normalize(35),
                                  height: AppDimensions.normalize(17),
                                  margin: EdgeInsets.only(
                                    top: AppDimensions.normalize(4),
                                    right: AppDimensions.normalize(4),
                                  ),
                                  decoration: BoxDecoration(
                                      color: AppColors.tabColor,
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.normalize(5))),
                                  child: Center(
                                    child: Text(
                                      fact,
                                      style: AppText.b2
                                          ?.copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Space.yf(1),
                          Text(
                            "Contains",
                            style: AppText.h3b,
                          ),
                          Space.yf(.2),
                          Text(
                            mealModel.ingredients,
                            style: AppText.b1?.copyWith(
                                color: AppColors.deepTeal, letterSpacing: .5),
                          ),
                          Space.yf(1),
                          Text(
                            "Description",
                            style: AppText.h3b,
                          ),
                          Space.yf(.2),
                          Text(
                            mealModel.description,
                            style: AppText.b1?.copyWith(
                                color: AppColors.greyText, letterSpacing: .2),
                          ),
                          Space.yf(1),
                          Text(
                            "Nutrition facts",
                            style: AppText.h3b,
                          ),
                          Space.yf(.25),
                          Text(
                            "Per 100g serving",
                            style: AppText.b1?.copyWith(
                                color: AppColors.deepTeal, letterSpacing: .2),
                          ),
                          Space.yf(1.2),
                          mealRow(
                              leftText: "Proteins",
                              rightText: mealModel.proteins),
                          mealRow(leftText: "Fats", rightText: mealModel.fats),
                          mealRow(
                              leftText: "Carbohydrates",
                              rightText: mealModel.carbohydrates),
                          mealRow(
                              leftText: "Calories",
                              rightText: mealModel.calories),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: AppDimensions.normalize(70),
                    right: AppDimensions.normalize(25),
                    child: filledFavIconSrack(),
                  )
                ],
              ),
            ),
            //  Space.yf(.1)
          ],
        ),
      ),
    );
  }
}
