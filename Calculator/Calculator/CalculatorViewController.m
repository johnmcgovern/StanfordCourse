//
//  CalculatorViewController.m
//  Calculator
//
//  Created by John McGovern on 8/5/12.
//  Copyright (c) 2012 John McGovern. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringNumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@end


@implementation CalculatorViewController

@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringNumber = _userIsInTheMiddleOfEnteringNumber;
@synthesize brain = _brain;

-(CalculatorBrain *)brain
{
    if(!_brain)
    {
        _brain = [[CalculatorBrain alloc] init];
    }
    return _brain;
    
}

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
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringNumber = NO;
    
}

- (IBAction)operationPressed:(id)sender
{
    if(self.userIsInTheMiddleOfEnteringNumber) [self enterPressed];
    double result = [[self brain] performOperation:[sender currentTitle]];
    NSString *resultString = [NSString stringWithFormat:@"%g",result];
    self.display.text = resultString;
}

@end
