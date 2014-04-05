//
//  ViewController.m
//  UpdateConstraints
//
//  Created by Giuseppe Santaniello on 26/10/13.
//  Copyright (c) 2013 Giuseppe Santaniello. All rights reserved.
//

#import "ViewController.h"
#import "myView.h"

@interface ViewController ()

@end

@implementation ViewController
{
    myView *square;
    NSArray *squareCenterPosition; //of Constraints
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    square = [[myView alloc] init];
    [self.view addSubview:square];
    
    squareCenterPosition= @[[NSLayoutConstraint constraintWithItem:square
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.view
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0
                                                          constant:0.0],
                            [NSLayoutConstraint constraintWithItem:square
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.view
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1.0
                                                          constant:0.0]];
    [self.view addConstraints:squareCenterPosition];}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if(UIInterfaceOrientationIsLandscape(toInterfaceOrientation)){
        
        [self removeAllConstraints];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[square]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(square)]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[square]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(square)]];
    }
    
    if(UIInterfaceOrientationIsPortrait(toInterfaceOrientation)){

        [self removeAllConstraints];
        [square addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[square(200)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(square)]];
        
        [square addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[square(200)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(square)]];
        
        [self.view addConstraints:squareCenterPosition];
    }
}

-(void)removeAllConstraints
{
    [square removeConstraints:[square constraints]];
    [self.view removeConstraints:[self.view constraints]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
