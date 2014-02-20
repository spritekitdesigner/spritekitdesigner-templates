//
//  skdParallaxNodeManager.h
//  ParallaxTree
//
//  Created by Gyetván András on 20/02/14.
//  Copyright (c) 2014 Developer. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

//@class skdParallaxNode;

@interface skdParallaxNodeManager : SKSpriteNode
@property (nonatomic, strong) NSMutableArray* parallaxNodes;
+ (skdParallaxNodeManager*) instance;
@end
