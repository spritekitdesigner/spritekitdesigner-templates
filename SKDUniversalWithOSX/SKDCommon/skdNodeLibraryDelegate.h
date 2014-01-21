//
//  skdNodeLibraryDelegate.h
//  SKDSeparatedWithOSX
//
//  Created by Gyetván András on 01/01/14.
//  Copyright (c) 2014 Developer. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@protocol skdNodeLibraryDelegate <NSObject>
- (id) libraryWillCreateNodeNamed:(NSString*)name;
- (id) libraryDidCreateNode:(SKNode*)node;
- (id) libraryWillCreateTexturedNodeNamed:(NSString*)name withTexture:(SKTexture*)texture;
//- (void) libraryDidCreateTexturedNode:(SKNode*)node withNamed:(NSString*)name;
@end
