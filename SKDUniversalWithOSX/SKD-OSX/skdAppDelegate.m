//
//  skdAppDelegate.m
//  SKDOSX
//
//  Created by Gyetván András on 30/12/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import "skdAppDelegate.h"

@implementation skdAppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    /* Pick a size for the scene */
	SKScene * scene = [self.nodeLibrary createSceneByName:@"MainScene" andDelegate:self];

    /* Set the scale mode to scale to fit the window */

    [self.skView presentScene:scene];

    self.skView.showsFPS = YES;
    self.skView.showsNodeCount = YES;
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

-(void)mouseDown:(NSEvent *)theEvent on:(SKNode*)node
{
	CGPoint location = [theEvent locationInNode:node];
}

-(void)update:(CFTimeInterval)currentTime on:(SKNode*)node
{
	
}
@end
