//
//  CalculatorBrain.m
//  Calculator
//
//  Created by John McGovern on 8/6/12.
//  Copyright (c) 2012 John McGovern. All rights reserved.
//

#import "CalculatorBrain.h"


@interface CalculatorBrain()

@property (nonatomic, strong) NSMutableArray *operandStack;

@end


@implementation CalculatorBrain

// Synthesize never allocates
@synthesize operandStack = _operandStack;

-(NSMutableArray *)operandStack
{
    if(_operandStack == nil)
    {
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

/*
-(void)setOperandStack:(NSMutableArray *)operandStack
{
    _operandStack = operandStack;
}
*/

-(void)pushOperand:(double)operand
{
    // Longer version
    //NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    //[self.operandStack addObject:operandObject];
    
    // Shorter version
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

-(double)popOperand
{
    //NSNumber *operandObject = [self.operandStack lastObject];
    // or
    NSNumber *operandObject = [[self operandStack] lastObject];
    
    // Make sure there is something in the array
    // before removing anything
    if (operandObject)
    {
    [self.operandStack removeLastObject];
    }
    
    return [operandObject doubleValue];
}

-(double) performOperation:(NSString *) operation
{
    double result = 0;
    
    if([operation isEqualToString:@"+"])
    {
        result = [self popOperand] + [self popOperand];
    }
    else if ([operation isEqualToString:@"*"])
    {
        result = [self popOperand] * [self popOperand];
    }
    else if ([operation isEqualToString:@"/"])
    {
        result = [self popOperand] / [self popOperand];
    }
    else if ([operation isEqualToString:@"-"])
    {
        result = [self popOperand] - [self popOperand];
    }
    
    [self pushOperand:result];
    
    return result;
}

@end
