//
//  UITableViewPanableCell.m
//  FastSMS
//
//  Created by Fernando Crespo on 04/12/12.
//  Copyright (c) 2012 Fernando Crespo. All rights reserved.
//

#import "FCUITableViewSwipeableCell.h"

@interface FCUITableViewSwipeableCell()
@property UITableViewCell *frontView;

@end

@implementation FCUITableViewSwipeableCell

-(id)init {
    self = [super init];
    [self initCustomCell];
    return self;
}

- (void)initCustomCell {
    // Initialization code
    if (self) {
        [self addSwipeGestureRecognizerWithDirection:UISwipeGestureRecognizerDirectionLeft];
        [self addSwipeGestureRecognizerWithDirection:UISwipeGestureRecognizerDirectionRight];
    }
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    [self initCustomCell];
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self initCustomCell];
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self initCustomCell];
    return self;
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)recognizer {
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"Should hide contentView and show backView");
        
//        [self.contentView removeFromSuperView];
        
    }
    else if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"Should show contentView and hide backView");
        
//        [self.backView removeFromSuperView];
    }
    NSLog(@"%@",self.backView);
}

- (void)addSwipeGestureRecognizerWithDirection:(UISwipeGestureRecognizerDirection)direction {
    UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRecognizer.direction = direction;
    [self addGestureRecognizer:swipeRecognizer];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
