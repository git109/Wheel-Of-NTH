//
//  Utils.m
//  WheelOfNTHv2
//
//  Created by Simon Janevski on 4/17/13.
//  Copyright (c) 2013 NTH. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (UIColor *)randomColor
{
	CGFloat hue = ( arc4random() % 256 / 256.0 );  
	CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; 
	CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
	return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
