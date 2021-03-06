//
//  NewValuesViewController.m
//  WheelOfNTHv2
//
//  Created by Simon Janevski on 4/18/13.
//  Copyright (c) 2013 NTH. All rights reserved.
//

#import "NewValuesViewController.h"

@interface NewValuesViewController ()

@property (weak, nonatomic) IBOutlet UITextField *text;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *values;

@end

@implementation NewValuesViewController
@synthesize text;
@synthesize tableView;
@synthesize values;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        if (!self.values) {
			self.values = [NSMutableArray array];
		}
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.text.delegate = self;
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ps_neutral"]];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)addButton:(id)sender
{
	if (![self.text.text isEqualToString:@""])
	{
		[self.values addObject:self.text.text];
		[self.tableView reloadData];
		self.text.text = @"";
	}
}

- (IBAction)doneButton:(id)sender
{
	[self.delegate newValuesSet:self.values];
	
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButton:(id)sender
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[self addButton:textField];
	return YES;
}
#pragma mark - Table View Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.values.count;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Cell";
	
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
	cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	
	cell.textLabel.text = [self.values objectAtIndex:indexPath.row];
	
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
{
	return @"Values";
}

@end
