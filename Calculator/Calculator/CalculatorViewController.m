//
//  CalculatorViewController.m
//  Calculator
//
//  Created by John McGovern on 8/5/12.
//  Copyright (c) 2012 John McGovern. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringNumber;
@end


@implementation CalculatorViewController

@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringNumber = _userIsInTheMiddleOfEnteringNumber;

- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = [sender currentTitle];
    //NSLog(@"Digit pressed = %@",digit);
    
    // Longer implementation
    //UILabel *myDisplay = [self display];
    //NSString *currentText = [myDisplay text];
    //NSString *newText = [currentText stringByAppendingString:digit];
    //[myDisplay setText:newText];
    
    
    if([self userIsInTheMiddleOfEnteringNumber])
    {
        // my displays text is equal to my displays text
        // by addending on the value of digit
        self.display.text = [self.display.text stringByAppendingString:digit];
    }
    else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringNumber = YES;
    }
}

- (IBAction)enterPressed
{
    
}

- (IBAction)operationPressed:(id)sender
{
    
}

@end
