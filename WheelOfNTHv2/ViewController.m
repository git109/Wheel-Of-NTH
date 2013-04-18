//
//  ViewController.m
//  WheelOfNTHv2
//
//  Created by Simon Janevski on 4/17/13.
//  Copyright (c) 2013 NTH. All rights reserved.
//

#import "ViewController.h"
#import "RotaryWheel.h"
#import "Names.h"
#import "Utils.h"
#import "NewValuesViewController.h"

#define degreesToRadians(x) (M_PI * (x) / 180.0)

@interface ViewController ()

@property (strong, nonatomic) IBOutlet RDDRotationControlSurface *rotationSurface;
@property (weak, nonatomic) IBOutlet XYPieChart *chart;
@property (strong, nonatomic) IBOutlet UITableView *winners;



@property (nonatomic, strong) RotaryWheel *wheel;

@end

@implementation ViewController
@synthesize wheel;
@synthesize rotationSurface;
@synthesize objects;
@synthesize winners;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	//self.wheel = [[RotaryWheel alloc] initWithFrame:CGRectMake(0, 0, 750, 750)];
	//[self.view insertSubview:self.wheel atIndex:0];
	
	self.objects = [[Names getAllNames] mutableCopy];
	
	[self.chart setDataSource:self];
    [self.chart setStartPieAngle:M_PI_2];
    [self.chart setAnimationSpeed:1.0];
    [self.chart setLabelFont:[UIFont fontWithName:@"Helvetica" size:20]];
    [self.chart setLabelRadius:160];
    [self.chart setShowPercentage:NO];
    [self.chart setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [self.chart setPieCenter:CGPointMake(360, 360)];
    [self.chart setUserInteractionEnabled:NO];
    [self.chart setLabelShadowColor:[UIColor blackColor]];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.chart reloadData];
}


#pragma mark - XYPieChart Data Source

- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart
{
    return self.objects.count;
}

- (CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index
{
    return 20;//[[self.slices objectAtIndex:index] intValue];
}

- (NSString *)pieChart:(XYPieChart *)pieChart textForSliceAtIndex:(NSUInteger)index
{
	return [self getRandomName];
}

- (UIColor *)pieChart:(XYPieChart *)pieChart colorForSliceAtIndex:(NSUInteger)index
{
    return [Utils randomColor];
}

#pragma mark - XYPieChart Delegate
- (void)pieChart:(XYPieChart *)pieChart didSelectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"did select slice at index %d",index);
    //self.selectedSliceLabel.text = [NSString stringWithFormat:@"$%@",[self.slices objectAtIndex:index]];
}

#pragma mark - Table View Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Cell";
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
{
	return @"Previous winners";
}

- (NSString*)getRandomName
{
	int r = arc4random() % self.objects.count;
	NSString *name = [self.objects objectAtIndex:r];
	[self.objects removeObjectAtIndex:r];
	return name;
}

- (IBAction)newValues:(id)sender
{
	NewValuesViewController *newValues = [[NewValuesViewController alloc] initWithNibName:@"NewValuesViewController" bundle:[NSBundle mainBundle]];
	newValues.modalPresentationStyle = UIModalPresentationFormSheet;
	newValues.parent = self;
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(didDismissModal)
												 name:@"ModalDismissed"
											   object:nil];
	
	[self presentViewController:newValues animated:YES completion:nil];
}

- (void)didDismissModal
{
	
	[self performSelector:@selector(reloadChartWithNewValues) withObject:nil afterDelay:0.5];
}

- (void)reloadChartWithNewValues
{
	NSLog(@"%i",self.objects.count);
	if (self.objects.count > 0)
		[self.chart reloadData];
}
-(void)rotationDidChangeByAngle:(CGFloat)angle
{
    self.chart.transform = CGAffineTransformRotate(self.chart.transform, degreesToRadians(-angle));
}

@end
