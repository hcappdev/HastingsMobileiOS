//
//  ContactsTableViewCell.h
//  Hastings
//
//  Created by Creighton Leif on 7/14/14.
//
//

#import <UIKit/UIKit.h>
#import "ContactsModel.h"

@interface ContactsTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *contactName;
@property (strong, nonatomic) IBOutlet UILabel *contactNumber;

-(void) bindCellDetails:(ContactsModel *) contactInfo;

@end
