//
//  UITableViewPanableCell.m
//  FastSMS
//
//  Created by Fernando Crespo on 04/12/12.
//  Copyright (c) 2012 Fernando Crespo. All rights reserved.
//

#import "UITableViewPanableCell.h"

@interface UITableViewPanableCell()

@property UISwipeGestureRecognizer *swipeRecognizer;
@property BOOL panning;

@end

@implementation UITableViewPanableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        // Initialization code
        self.swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
        self.swipeRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
        [self addGestureRecognizer:self.swipeRecognizer];
        
        self.swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
        self.swipeRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
        [self addGestureRecognizer:self.swipeRecognizer];
        if (self.backgroundView == nil) {
            UIView *defaultBackgroundView = [[UIView alloc] initWithFrame:self.contentView.frame];
            defaultBackgroundView.backgroundColor = [UIColor darkGrayColor];
            self.backgroundView = defaultBackgroundView;
        }
    }
    return self;
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)recognizer {
    
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Swiped Left" message:@"test" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    else if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Swiped Right" message:@"test" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
