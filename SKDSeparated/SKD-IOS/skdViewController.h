//
//  skdViewController.h
//  SKDUniversal
//

//  Copyright (c) 2013 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "skdNodeLibrary.h"
#import "skdNodeDelegate.h"

@interface skdViewController : UIViewController<skdNodeDelegate>
@property (strong, nonatomic) IBOutlet skdNodeLibrary *nodeLibrary;
@property (weak, nonatomic) IBOutlet SKView *skView;

@end
