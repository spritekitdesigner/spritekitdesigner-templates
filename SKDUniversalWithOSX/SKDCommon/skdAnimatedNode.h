//
//  skdAnimatedNode.h
//  ParallaxTree
//
//  Created by Gyetván András on 19/02/14.
//  Copyright (c) 2014 Developer. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface skdAnimatedNode : SKSpriteNode
@property (nonatomic) NSString* atlasName;
@property (nonatomic) NSTimeInterval timePerFrame;
@property (nonatomic) BOOL enabled;
@property (strong) SKAction* animationAction;
@end
