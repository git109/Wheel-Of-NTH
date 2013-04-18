//
//  NewValuesViewController.h
//  WheelOfNTHv2
//
//  Created by Simon Janevski on 4/18/13.
//  Copyright (c) 2013 NTH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface NewValuesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>


@property (strong, nonatomic) ViewController *parent;

@end
