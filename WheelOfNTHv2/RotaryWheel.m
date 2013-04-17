//
//  RotaryWheel.m
//  WheelOfNTH
//
//  Created by Simon Janevski on 4/17/13.
//  Copyright (c) 2013 NTH. All rights reserved.
//

#import "RotaryWheel.h"
#import "Names.h"
#import "Utils.h"
#import <QuartzCore/QuartzCore.h>

@interface RotaryWheel()

@property (nonatomic, strong) NSMutableArray *names;

- (void)drawWheel;

@end

@implementation RotaryWheel

@synthesize container;
@synthesize numberOfSections;
@synthesize names;

-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
		self.frame = frame;
		self.names = [[Names getAllNames] mutableCopy];
        self.numberOfSections = [self.names count];
        [self drawWheel];
		self.backgroundColor = [UIColor clearColor];
    }
    return(self);
}

- (void)drawWheel
{
	container = [[UIView alloc] initWithFrame:self.frame];
	CGFloat angleSize = 2*M_PI/numberOfSections;
	for (int i = 0; i < numberOfSections; i++) {
		UILabel *im = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 360, 150)];
		im.backgroundColor = [Utils randomColor];
		im.text = [self getRandomName];
		im.layer.anchorPoint = CGPointMake(1.0f, 0.5f);
		im.layer.position = CGPointMake(container.bounds.size.width/2.0, container.bounds.size.height/2.0);
		im.transform = CGAffineTransformMakeRotation(angleSize * i);
		im.tag = i;
		[container addSubview:im];
	}
	container.userInteractionEnabled = NO;
	[self addSubview:container];
}

- (NSString*)getRandomName
{
	int r = arc4random() % self.names.count;
	NSString *name = [self.names objectAtIndex:r];
	[self.names removeObjectAtIndex:r];
	return name;
}

@end
