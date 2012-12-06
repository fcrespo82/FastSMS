//
//  SMSCell.h
//  FastSMS
//
//  Created by Fernando Crespo on 06/12/12.
//  Copyright (c) 2012 Fernando Crespo. All rights reserved.
//

#import "UITableViewSwipeableCell.h"

@interface SMSCell : UITableViewSwipeableCell

@property (weak, nonatomic) IBOutlet UIImageView *SMSCellImage;
@property (weak, nonatomic) IBOutlet UILabel *SMSCellTitle;
@property (weak, nonatomic) IBOutlet UILabel *SMSCellText;

@end
