//
//  SodexoModel.h
//  Hastings
//
//  Created by Creighton Leif on 7/3/14.
//
//

#import <Foundation/Foundation.h>

@interface SodexoModel : NSObject

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *itemDescription;
@property (nonatomic, copy) NSString *calories;
@property (nonatomic, copy) NSString *fat;
@property (nonatomic, copy) NSString *saturatedFat;
@property (nonatomic, copy) NSString *sodium;
@property (nonatomic, copy) NSString *carbohydrates;
@property (nonatomic, copy) NSString *sugars;
@property (nonatomic, copy) NSString *proteins;
@property (nonatomic, copy) NSString *mealType;
@property (nonatomic, copy) NSString *day;
@property (nonatomic, copy) NSString *menuDate;

@property (nonatomic, copy) NSString *allergens;
@property (nonatomic, copy) NSString *serving;
@property (nonatomic, copy) NSString *fatDV;
@property (nonatomic, copy) NSString *calContentFat;
@property (nonatomic, copy) NSString *saturatedFatDV;
@property (nonatomic, copy) NSString *transFat;
@property (nonatomic, copy) NSString *cholesterol;
@property (nonatomic, copy) NSString *cholesterolDV;
@property (nonatomic, copy) NSString *carbohydratesDV;
@property (nonatomic, copy) NSString *fiber;
@property (nonatomic, copy) NSString *fiberDV;
@property (nonatomic, copy) NSString *vitaminA;
@property (nonatomic, copy) NSString *vitaminC;
@property (nonatomic, copy) NSString *calcium;
@property (nonatomic, copy) NSString *ironDV;
@property (nonatomic, copy) NSString *ingredients;

@end
