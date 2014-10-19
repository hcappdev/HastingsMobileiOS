//
//  NutritionViewController.m
//  Hastings
//
//  Created by Creighton Leif on 7/16/14.
//
//

#import "NutritionViewController.h"
#import "SodexoModel.h"
@interface NutritionViewController ()

@end

@implementation NutritionViewController

@synthesize itemName                = _itemName;
@synthesize itemCaloriesValue       = _itemCaloriesValue;
@synthesize itemFatsValue           = _itemFatsValue;
@synthesize itemSatFatsValue        = _itemSatFatsValue;
@synthesize itemSodiumValue         = _itemSodiumValue;
@synthesize itemCarbsValue          = _itemCarbsValue;
@synthesize itemSugarValue          = _itemSugarValue;
@synthesize itemProteinValue        = _itemProteinValue;
@synthesize model                   = _model;
@synthesize itemAllergenValue       = _itemAllergenValue;
@synthesize itemServingValue        = _itemServingValue;
@synthesize itemFatDVValue          = _itemFatDVValue;
@synthesize itemCalContentFatValue  = _itemCalContentFatValue;
@synthesize itemSatFatDVValue       = _itemSatFatDVValue;
@synthesize itemTransFat            = _itemTransFat;
@synthesize itemCholesterolValue    = _itemCholesterolValue;
@synthesize itemCholesterolDVValue  = _itemCholesterolDVValue;
@synthesize itemCarbsDVValue        = _itemCarbsDVValue;
@synthesize itemFiberValue          = _itemFiberValue;
@synthesize itemFiberDVValue        = _itemFiberDVValue;
@synthesize itemVitAValue           = _itemVitAValue;
@synthesize itemVitCValue           = _itemVitCValue;
@synthesize itemCalciumDVValue      = _itemCalciumDVValue;
@synthesize itemIronDVValue         = _itemIronDVValue;
@synthesize itemIngredients         = _itemIngredients;

-(id)initWithSodexoModel:(SodexoModel *) sodexoModel{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.model  = sodexoModel;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.itemName.text                  = self.model.itemName;
    self.itemCaloriesValue.text         = self.model.calories;
    self.itemFatsValue.text             = self.model.fat;
    self.itemSatFatsValue.text          = self.model.saturatedFat;
    self.itemSodiumValue.text           = self.model.sodium;
    self.itemCarbsValue.text            = self.model.carbohydrates;
    self.itemSugarValue.text            = self.model.sugars;
    self.itemProteinValue.text          = self.model.proteins;
    self.itemAllergenValue.text         = self.model.allergens;
    self.itemServingValue.text          = self.model.serving;
    self.itemFatDVValue.text            = self.model.fatDV;
    self.itemCalContentFatValue.text    = self.model.calContentFat;
    self.itemSatFatDVValue.text         = self.model.saturatedFatDV;
    self.itemTransFat.text              = self.model.transFat;
    self.itemCholesterolValue.text      = self.model.cholesterol;
    self.itemCholesterolDVValue.text    = self.model.cholesterolDV;
    self.itemCarbsDVValue.text          = self.model.carbohydratesDV;
    self.itemFiberValue.text            = self.model.fiber;
    self.itemFiberDVValue.text          = self.model.fiberDV;
    self.itemVitAValue.text             = self.model.vitaminA;
    self.itemVitCValue.text             = self.model.vitaminC;
    self.itemCalciumDVValue.text        = self.model.calcium;
    self.itemIronDVValue.text           = self.model.ironDV;
    self.itemIngredients.text           = self.model.ingredients;
    
}

//google analytics
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.screenName = @"Nutrition Facts";
}

@end
