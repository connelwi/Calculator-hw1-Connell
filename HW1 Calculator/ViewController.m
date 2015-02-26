//
//  ViewController.m
//  HW1 Calculator
//
//  Created by William Connell on 2/1/15.
//  Copyright (c) 2015 edu.cudenver.csci.connell. All rights reserved.
//

#import "ViewController.h"
#import "CalcuatorBrain.h"

@interface ViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalcuatorBrain *brain;
@property (nonatomic) BOOL decimalAlreadyExists;
@property (nonatomic) BOOL enterPresseddeci;
@property (weak, nonatomic) IBOutlet UILabel *fullDisplay;

@end



@implementation ViewController

@synthesize display;
@synthesize userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;



- (CalcuatorBrain *)brain
{
    if (!_brain) _brain = [[CalcuatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = [sender currentTitle];
    if (self.userIsInTheMiddleOfEnteringANumber)
    {
    self.display.text = [self.display.text stringByAppendingString:digit];
        self.fullDisplay.text = [self.fullDisplay.text stringByAppendingString:digit];
    }
    else
    {
        self.display.text = digit;
        self.fullDisplay.text = [self.fullDisplay.text stringByAppendingString:digit];
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
    self.enterPresseddeci = YES;
    self.fullDisplay.text = [self.fullDisplay.text stringByAppendingString:@" Enter "];
}

- (IBAction)operationPressed:(id)sender {
    if (self.userIsInTheMiddleOfEnteringANumber)
    {
        [self enterPressed];
    }
    NSString *operation = [sender currentTitle];
    double result = [self.brain performOperation:operation];
    self.display.text = [NSString stringWithFormat:@"= %g", result];
    self.fullDisplay.text = [self.fullDisplay.text stringByAppendingString:operation];
}
- (IBAction)decimal:(UIButton *)sender {
    
    if(self.enterPresseddeci == YES)
    {
        self.decimalAlreadyExists = NO;
    }
    else if (self.decimalAlreadyExists == YES)
    {
        return;
    }
        else
    {
        self.decimalAlreadyExists = YES;
    }
    self.display.text = [self.display.text stringByAppendingString:@"."];
    self.fullDisplay.text = [self.fullDisplay.text stringByAppendingString:@"."];
    
}
- (IBAction)pipressed:(id)sender {
    if (self.userIsInTheMiddleOfEnteringANumber)
    {
        self.fullDisplay.text = [self.fullDisplay.text stringByAppendingString:@"3.141"];
        self.display.text = [self.display.text stringByAppendingString:@"3.141"];
    }
    else
    {
        self.fullDisplay.text = @"3.141";
        self.display.text = @"3.141";
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }

}

- (IBAction)Clear:(UIButton *)sender {
    self.display.text = @"";
    self.fullDisplay.text = @"";
    
}

- (IBAction)backspace:(UIButton *)sender {
    
    NSString *present = self.display.text;
    double length = [present length];
    NSString *temp = [present substringToIndex:length -1];
    [display setText:temp];
    //Worked before but for some reason it keeps calling a break
    //couldnt figure out how to fix it seeing as I never broke
    //it, it just stopped working?
    
}



@end
