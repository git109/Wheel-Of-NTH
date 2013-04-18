//
//  ViewController.h
//  WheelOfNTHv2
//
//  Created by Simon Janevski on 4/17/13.
//  Copyright (c) 2013 NTH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RDDRotationControlSurface.h"
#import "XYPieChart.h"
#import "NewValuesViewController.h"

@interface ViewController : UIViewController <RDDRotationControlSurfaceDelegate, XYPieChartDelegate, XYPieChartDataSource, UITableViewDataSource, UITableViewDelegate, valuesDelegate>

@property (nonatomic, strong) NSMutableArray *objects;

@end
