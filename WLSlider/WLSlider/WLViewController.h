//
//  WLViewController.h
//  WLSlider
//
//  Created by Aneesha Mathew on 07/08/12.
//  Copyright (c) 2012 aneesha@walnutlabs.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLSlider.h"
@interface WLViewController : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *sliderValue;
@property (retain, nonatomic) IBOutlet WLSlider *slider;

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@end
