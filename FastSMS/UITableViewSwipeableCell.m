//
//  UITableViewPanableCell.m
//  FastSMS
//
//  Created by Fernando Crespo on 04/12/12.
//  Copyright (c) 2012 Fernando Crespo. All rights reserved.
//

#import "UITableViewSwipeableCell.h"

@interface UITableViewSwipeableCell()

@end

@implementation UITableViewSwipeableCell

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
        
        if (self.backgroundView == nil) {
            /* Add a default empty background view to make it clear that it's all working */
            UIView *defaultBackgroundView = [[UIView alloc] initWithFrame:self.contentView.frame];
            defaultBackgroundView.backgroundColor = [UIColor darkGrayColor];
            self.backgroundView = defaultBackgroundView;
        }
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
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Swiped Left" message:@"test" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        [alert show];
        
        NSLog(@"Hide contentView");
//        [self.contentView setAlpha:0.5];
        [self.contentView setHidden:YES];
        [self bringSubviewToFront:self.backgroundView];
        [self.backgroundView setHidden:NO];
    }
    else if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Swiped Right" message:@"test" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        [alert show];
        
        NSLog(@"Show contentView");
//        [self.contentView setAlpha:1.0];
        [self.contentView setHidden:NO];
        [self sendSubviewToBack:self.backgroundView];
        [self.backgroundView setHidden:YES];
    }
    
    NSLog(@"%f", self.contentView.alpha);
    [self setNeedsDisplay];
    
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
