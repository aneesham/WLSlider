//
//  WLSlider.m
//  Ruckus
//
//  Created by Aneesha Mathew on 06/08/12.
//  Copyright (c) 2012 aneesha@walnutlabs.com. All rights reserved.
//

#import "WLSlider.h"

@implementation WLSlider

@synthesize bubble;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    //    [self addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
		
         
        self.bubble = [[UIImageView alloc]initWithFrame:CGRectMake(20, 0, 35, 23)];
        bubble.image = [UIImage imageNamed:@"popup.png"];;
        [self addSubview:bubble];
        bubble.hidden = YES;
        self.clipsToBounds = NO;
    }
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)valueChanged {
	
//	[sliderValueController updateSliderValueTo:self.value];
	
	CGFloat sliderMin =  self.minimumValue;
	CGFloat sliderMax = self.maximumValue;
	CGFloat sliderMaxMinDiff = sliderMax - sliderMin;
	CGFloat sliderValue = self.value;
	
	if(sliderMin < 0.0) {
        
		sliderValue = self.value-sliderMin;
		sliderMax = sliderMax - sliderMin;
		sliderMin = 0.0;
		sliderMaxMinDiff = sliderMax - sliderMin;
	}
	
	CGFloat xCoord = ((sliderValue-sliderMin)/sliderMaxMinDiff)*[self frame].size.width-bubble.frame.size.width/2.0;
	
	CGFloat halfMax = (sliderMax+sliderMin)/2.0;
	
	if(sliderValue > halfMax) {
		
		sliderValue = (sliderValue - halfMax)+(sliderMin*1.0);
		sliderValue = sliderValue/halfMax;
		sliderValue = sliderValue*11.0;
		
		xCoord = xCoord - sliderValue;
	}
	
	else if(sliderValue <  halfMax) {
		
		sliderValue = (halfMax - sliderValue)+(sliderMin*1.0);
		sliderValue = sliderValue/halfMax;
		sliderValue = sliderValue*11.0;
		
		xCoord = xCoord + sliderValue;
	}
    
    bubble.frame = CGRectMake(xCoord, -18, bubble.frame.size.width, bubble.frame.size.height);
    bubble.hidden = NO;
    
    NSLog(@"slider Value:%f", self.value);
    NSLog(@"frame:%@", NSStringFromCGRect(bubble.frame));
    [self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {  
     [self setNeedsDisplay];
    [super touchesBegan:touches withEvent:event];

}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
     [self setNeedsDisplay];
    [super touchesMoved:touches withEvent:event];
    [self valueChanged];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(!bubble.hidden)
        bubble.hidden = YES;
    [super touchesEnded:touches withEvent:event];
}

-(void)updateSliderValueTo:(CGFloat)_value {
    
	//[sliderValue setText:[NSString stringWithFormat:@"%.2f %%", _value*100]];
}

@end
