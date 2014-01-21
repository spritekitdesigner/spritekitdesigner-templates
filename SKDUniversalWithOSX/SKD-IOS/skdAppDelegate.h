//
//  skdAppDelegate.h
//  SKDUniversal
//
//  Created by Gyetván András on 28/12/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "skdNodeLibrary.h"

@interface skdAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (weak) IBOutlet skdNodeLibrary *nodeLibrary;

@end
