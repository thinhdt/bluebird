//
//  ViewController.m
//  bluebird
//
//  Created by mac on 7/23/15.
//  Copyright (c) 2015 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *bird;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self drawJungle];
    [self addBird];
    [self flyUpAndDown];
}


- (void) drawJungle {
    UIImageView *backgroud = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jungle.jpg"]];
    backgroud.frame = self.view.bounds;
    
    backgroud.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:backgroud];
}

- (void) addBird {
    bird = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 110, 68)];
    bird.animationImages = @[ [UIImage imageNamed:@"bird0.png"],
                              [UIImage imageNamed:@"bird1.png"],
                              [UIImage imageNamed:@"bird2.png"],
                              [UIImage imageNamed:@"bird3.png"],
                              [UIImage imageNamed:@"bird4.png"],
                              [UIImage imageNamed:@"bird5.png"],
                             ];
    
    bird.animationRepeatCount = -1; // forever loop
    bird.animationDuration = 1; // khoang thoi gian chay giua annimation . time to run 6 birds
    
    [self.view addSubview:bird];
    [bird startAnimating];
    
}

- (void) flyUpAndDown {
    bird.transform = CGAffineTransformIdentity; // reset all the before transform
    [UIView animateWithDuration:5 animations:^{
        // the bird is at the bottom screen
        bird.center = CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height);
    } completion:^(BOOL finished) {
        
        bird.transform = CGAffineTransformConcat(
                                                 CGAffineTransformMakeScale (-1, 1),
                                                 CGAffineTransformMakeRotation (M_PI_4));
        
        [UIView animateWithDuration:5 animations:^{
            bird.center = CGPointMake(0, 0);
        } completion:^(BOOL finished) {
            [self flyUpAndDown];
        }];
    }];
    
    
}


@end
