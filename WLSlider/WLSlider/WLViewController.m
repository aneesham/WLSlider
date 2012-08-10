//
//  WLViewController.m
//  WLSlider
//
//  Created by Aneesha Mathew on 07/08/12.
//  Copyright (c) 2012 aneesha@walnutlabs.com. All rights reserved.
//

#import "WLViewController.h"

@interface WLViewController ()

@end

@implementation WLViewController
@synthesize sliderValue;
@synthesize slider;
@synthesize tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   // self.slider = [[[WLSlider alloc]initWithFrame:CGRectMake(77, 153, 182, 23)] autorelease];
   // [self.slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    self.tableView.rowHeight = 70.0;
}

- (void)viewDidUnload
{
    [self setSliderValue:nil];
    [self setSlider:nil];
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [sliderValue release];
    [slider release];
    [tableView release];
    [super dealloc];
}

- (void)sliderValueChanged:(WLSlider *)sender
{
    self.sliderValue.text = [NSString stringWithFormat:@"%f", sender.value] ;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
   // WLIssue *issue = [_issueList objectAtIndex:indexPath.row];
    
    if(cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] autorelease];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        
        self.slider = [[[WLSlider alloc]initWithFrame:CGRectMake(0, 0, 130, 30)] autorelease];
        
        cell.accessoryView = self.slider;
        
        slider.tag = indexPath.row;
          [self.slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    // Configure the cell...
    
    return cell;
}

@end
