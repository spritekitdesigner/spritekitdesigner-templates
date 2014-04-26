//
//  skdAppDelegate.m
//  SKDOSX
//

#import "skdAppDelegate.h"
#import "skdParallaxNode.h"
@implementation skdAppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.skView.showsFPS = YES;
    self.skView.showsNodeCount = YES;
	
	SKScene * scene = [self.nodeLibrary createSceneByName:@"FirstScene" andDelegate:self];
    [self.skView presentScene:scene];

}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

-(void)mouseDown:(NSEvent *)theEvent on:(SKNode*)node
{
}

-(void)update:(CFTimeInterval)currentTime on:(SKNode*)node
{
	
}
@end
