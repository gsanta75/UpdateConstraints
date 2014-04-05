//
//  ViewController.m
//  UpdateConstraints
//
//  Created by Giuseppe Santaniello on 26/10/13.
//  Copyright (c) 2013 Giuseppe Santaniello. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *squareView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *squareCenterX;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *squareCenterY;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *squareWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *squareHeight;

@end

@implementation ViewController
{
    NSArray *squarePosition; //of Constraints
    NSArray *squareDimension; //of Constraints
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    squarePosition = @[self.squareCenterX, self.squareCenterY];
    squareDimension = @[self.squareWidth, self.squareHeight];
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if(UIInterfaceOrientationIsLandscape(toInterfaceOrientation)){
        
        NSDictionary *myView = @{@"squareView" : self.squareView};
        [self removeAllConstraints];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[squareView]|" options:0 metrics:nil views:myView]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[squareView]|" options:0 metrics:nil views:myView]];
        
    }
    
    if(UIInterfaceOrientationIsPortrait(toInterfaceOrientation)){
        [self removeAllConstraints];
        [self.squareView addConstraints:squareDimension];
        [self.view addConstraints:squarePosition];
        
    }

}

-(void)removeAllConstraints
{
    [self.squareView removeConstraints:[self.squareView constraints]];
    [self.view removeConstraints:[self.view constraints]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
