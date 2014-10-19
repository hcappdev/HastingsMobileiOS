//
//  SodexoTableViewCell.h
//  Hastings
//
//  Created by Creighton Leif on 7/3/14.
//
//

#import <UIKit/UIKit.h>
#import "SodexoModel.h"


@interface SodexoTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *menuItem;
@property (strong, nonatomic) IBOutlet UILabel *menuDescription;

-(void) bindCellDetails:(SodexoModel *) menuDetails;

@end
