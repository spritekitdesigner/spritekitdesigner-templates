//
//  skdViewController.m
//  SKDUniversal
//
//  Created by Gyetván András on 28/12/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import "skdViewController.h"

@implementation skdViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    self.skView.showsFPS = YES;
    self.skView.showsNodeCount = YES;
    
	SKScene * scene = [self.nodeLibrary createSceneByName:@"FirstScene" andDelegate:self];
    
    [self.skView presentScene:scene];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event on:(SKNode*)node
{
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:node];
        NSLog(@"position %f,%f",location.x,location.y);
    }
}

-(void)update:(CFTimeInterval)currentTime on:(SKNode*)node
{
	//
}

@end
