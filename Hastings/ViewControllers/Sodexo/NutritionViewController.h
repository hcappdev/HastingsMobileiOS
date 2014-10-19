//
//  NutritionViewController.h
//  Hastings
//
//  Created by Creighton Leif on 7/16/14.
//
//

#import <UIKit/UIKit.h>
#import "SodexoModel.h"
#import "GAITrackedViewController.h"

@interface NutritionViewController : GAITrackedViewController
@property (strong, nonatomic) IBOutlet UILabel *itemName;

@property (strong, nonatomic) IBOutlet UILabel *itemCalories;
@property (strong, nonatomic) IBOutlet UILabel *itemFats;
@property (strong, nonatomic) IBOutlet UILabel *itemSatFats;
@property (strong, nonatomic) IBOutlet UILabel *itemSodium;
@property (strong, nonatomic) IBOutlet UILabel *itemCarbs;
@property (strong, nonatomic) IBOutlet UILabel *itemSugar;
@property (strong, nonatomic) IBOutlet UILabel *itemProtein;

@property (strong, nonatomic) IBOutlet UILabel *itemCaloriesValue;
@property (strong, nonatomic) IBOutlet UILabel *itemFatsValue;
@property (strong, nonatomic) IBOutlet UILabel *itemSatFatsValue;
@property (strong, nonatomic) IBOutlet UILabel *itemSodiumValue;
@property (strong, nonatomic) IBOutlet UILabel *itemCarbsValue;
@property (strong, nonatomic) IBOutlet UILabel *itemSugarValue;
@property (strong, nonatomic) IBOutlet UILabel *itemProteinValue;
@property (strong, nonatomic) IBOutlet UILabel *itemAllergenValue;
@property (strong, nonatomic) IBOutlet UILabel *itemServingValue;
@property (strong, nonatomic) IBOutlet UILabel *itemFatDVValue;
@property (strong, nonatomic) IBOutlet UILabel *itemCalContentFatValue;
@property (strong, nonatomic) IBOutlet UILabel *itemSatFatDVValue;
@property (strong, nonatomic) IBOutlet UILabel *itemTransFat;
@property (strong, nonatomic) IBOutlet UILabel *itemCholesterolValue;
@property (strong, nonatomic) IBOutlet UILabel *itemCholesterolDVValue;
@property (strong, nonatomic) IBOutlet UILabel *itemCarbsDVValue;
@property (strong, nonatomic) IBOutlet UILabel *itemFiberValue;
@property (strong, nonatomic) IBOutlet UILabel *itemFiberDVValue;
@property (strong, nonatomic) IBOutlet UILabel *itemVitAValue;
@property (strong, nonatomic) IBOutlet UILabel *itemVitCValue;
@property (strong, nonatomic) IBOutlet UILabel *itemCalciumDVValue;
@property (strong, nonatomic) IBOutlet UILabel *itemIronDVValue;
@property (strong, nonatomic) IBOutlet UILabel *itemIngredients;



@property (retain, nonatomic) SodexoModel        *model;

-(id)initWithSodexoModel:(SodexoModel *) sodexoModel;

@end
