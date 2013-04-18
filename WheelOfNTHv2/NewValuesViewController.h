//
//  NewValuesViewController.h
//  WheelOfNTHv2
//
//  Created by Simon Janevski on 4/18/13.
//  Copyright (c) 2013 NTH. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol valuesDelegate <NSObject>

- (void)newValuesSet:(NSArray*)values;

@end

@interface NewValuesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, weak) id <valuesDelegate> delegate;

@end
