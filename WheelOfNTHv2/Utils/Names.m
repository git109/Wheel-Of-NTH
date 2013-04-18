//
//  Names.m
//  WheelOfNTHv2
//
//  Created by Simon Janevski on 4/17/13.
//  Copyright (c) 2013 NTH. All rights reserved.
//

#import "Names.h"

@implementation Names

+ (NSArray*)getAllNames
{
	NSArray *names = [NSArray arrayWithObjects:
					  @"Симон",
					  @"Дарко",
					  @"Даниела",
					  @"Елена",
					  @"Димитар",
					  @"Александар", nil];
	return names;
}

@end
