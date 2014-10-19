//
//  SodexoTableViewCell.m
//  Hastings
//
//  Created by Creighton Leif on 7/3/14.
//
//

#import "SodexoTableViewCell.h"

@implementation SodexoTableViewCell

@synthesize menuItem = _menuItem;
@synthesize menuDescription = _menuDescription;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
 
    }
    return self;
}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];

}

-(void) bindCellDetails:(SodexoModel *) menuDetails {
    
    self.menuItem.text = menuDetails.itemName;
    self.menuDescription.text = menuDetails.itemDescription;
    
}

@end
