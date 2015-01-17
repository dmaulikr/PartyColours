//
//  ViewController.m
//  PartyColours
//
//  Created by Edward Bowyer on 09/09/2013.
//  Copyright (c) 2013 Edward Bowyer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,retain) NSMutableArray* colourArray;
@property (strong) NSTimer * timer;

@end

@implementation ViewController

float standardSpeed = 0.1;
float mediumSpeed = 0.01;
float fastSpeed = 0.001;
 
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int numOfButtons = 3;
    int padding = 40;
    CGSize gridSize = CGSizeMake(1, 3);
    
    // Creating Stop button
    
    CGRect stopButtonSize = CGRectMake(5, 5, 50, 50);
    UIButton* stopButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    stopButton.frame = stopButtonSize;
    stopButton.tag = numOfButtons+1;
    [stopButton setTitle:@"STOP!" forState:UIControlStateNormal];
    
    //Adding Stop button to the view and ataching an action listener
    [stopButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopButton];
    
    self.colourArray = [NSMutableArray array];
    [self.colourArray addObject:[UIColor purpleColor]];
    [self.colourArray addObject:[UIColor redColor]];
    [self.colourArray addObject:[UIColor blueColor]];
    [self.colourArray addObject:[UIColor greenColor]];
    [self.colourArray addObject:[UIColor orangeColor]];
    [self.colourArray addObject:[UIColor yellowColor]];
    
    for(int i=0; i<numOfButtons; i++)
    {
        int width = (self.view.frame.size.width / gridSize.width);
        int height = (self.view.frame.size.height / gridSize.height);
        
        int x = (i % (int)gridSize.width) * width;
        int y = (i/(int)gridSize.width) * height;
        
        x += (padding * 2);
        y += padding;
        
        width -= (padding * 4);
        height -= (padding * 2);
        
        NSString* buttonText = @"Press to party!";
        
        if(i == 1)
        {
            buttonText = @"Press to party hard!";
        }
        
        if(i == 2)
        {
            buttonText = @"Press to party too hard!";
        }
        
        CGRect rect = CGRectMake(x, y, width, height);
        UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = rect;
        button.tag = i+1;
        [button setTitle:buttonText forState:UIControlStateNormal];
        
          [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
      [self.view addSubview:button];
    }
}


-(void)buttonPressed:(id)sender
{
    UIButton* button = sender;
    
if(button.tag == 1)
{
self.timer = [NSTimer scheduledTimerWithTimeInterval:standardSpeed target:self selector:@selector(changeColourOfBackground) userInfo:nil repeats:YES];
}
    else if (button.tag == 2)
    {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:mediumSpeed target:self selector:@selector(changeColourOfBackground) userInfo:nil repeats:YES];
    }
    
        else if (button.tag == 3)
        {
            self.timer = [NSTimer scheduledTimerWithTimeInterval:fastSpeed target:self selector:@selector(changeColourOfBackground) userInfo:nil repeats:YES];
        }
            else if (button.tag == 4)
            {
                if([self.timer isValid])
                {
                    [self.timer invalidate], self.timer=nil;
                }
            }

    
}

-(void)changeColourOfBackground
{
    // Changing background to random colour
    int randomNumber = arc4random_uniform(self.colourArray.count);
    self.view.backgroundColor = [self.colourArray objectAtIndex:randomNumber];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
