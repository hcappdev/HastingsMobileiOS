//
//  ContactsTableViewCell.m
//  Hastings
//
//  Created by Creighton Leif on 7/14/14.
//
//

#import "ContactsTableViewCell.h"

@implementation ContactsTableViewCell

@synthesize contactName     = _contactName;
@synthesize contactNumber   = _contactNumber;

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];

}

-(void) bindCellDetails:(ContactsModel *) contactInfo {
    
    self.contactName.text   = contactInfo.contactName;
    self.contactNumber.text = contactInfo.contactNumber;
    
}

@end
