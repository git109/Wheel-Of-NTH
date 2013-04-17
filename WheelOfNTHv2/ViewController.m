//
//  ViewController.m
//  WheelOfNTHv2
//
//  Created by Simon Janevski on 4/17/13.
//  Copyright (c) 2013 NTH. All rights reserved.
//

#import "ViewController.h"
#import "RotaryWheel.h"

#define degreesToRadians(x) (M_PI * (x) / 180.0)

@interface ViewController ()

@property (strong, nonatomic) IBOutlet RDDRotationControlSurface *rotationSurface;

@property (nonatomic, strong) RotaryWheel *wheel;

@end

@implementation ViewController
@synthesize wheel;
@synthesize rotationSurface;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.wheel = [[RotaryWheel alloc] initWithFrame:CGRectMake(0, 0, 750, 750)];
	[self.view insertSubview:self.wheel atIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)rotationDidChangeByAngle:(CGFloat)angle {
    self.wheel.transform = CGAffineTransformRotate(self.wheel.transform, degreesToRadians(-angle));
}

@end
