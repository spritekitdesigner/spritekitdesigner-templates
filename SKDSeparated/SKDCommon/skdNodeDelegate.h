//
//  skdNodeDelegate.h
//  SKDUniversal
//
//  Created by Gyetván András on 28/12/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@protocol skdNodeDelegate <NSObject>
#if defined(__IPHONE_OS_VERSION_MAX_ALLOWED)
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event on:(SKNode*)node;
#else
-(void)mouseDown:(NSEvent *)theEvent on:(SKNode*)node;
#endif

-(void)update:(CFTimeInterval)currentTime on:(SKNode*)node;
@end
