//
//  skdParallaxNode.h
//  SKDSeparatedWithOSX
//
//  Created by Gyetván András on 05/01/14.
//  Copyright (c) 2014 Developer. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface skdParallaxNode : SKNode
@property (nonatomic) float parallaxOffset;
- (id) initWithParallaxOffset:(float)po;
- (void) update;
- (void)updateOffset;
@end
