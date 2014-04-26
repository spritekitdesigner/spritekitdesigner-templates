//
//  skdAppDelegate.h
//  SKDOSX
//

#import <Cocoa/Cocoa.h>
#import <SpriteKit/SpriteKit.h>
#import "skdNodeLibrary.h"

@interface skdAppDelegate : NSObject <NSApplicationDelegate,skdNodeDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet SKView *skView;
@property (weak) IBOutlet skdNodeLibrary *nodeLibrary;

@end
