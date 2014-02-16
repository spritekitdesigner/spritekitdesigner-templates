//
//  skdParallaxNode.m
//  SKDSeparatedWithOSX
//
//  Created by Gyetván András on 05/01/14.
//  Copyright (c) 2014 Developer. All rights reserved.
//

#import "skdParallaxNode.h"

@implementation skdParallaxNode
- (id) init
{
	self = [super init];
	if(self) {
		self.parallaxOffset = 75;
	}
	return self;
}

- (id) initWithParallaxOffset:(float)po
{
	self = [super init];
	if(self) {
		self.parallaxOffset = po;
	}
	return self;
}

- (void) update
{
	[self updateOffset];
}

- (void)updateOffset {
    SKScene *scene = self.scene;
    SKNode *parent = self.parent;
    
    CGPoint scenePos = [scene convertPoint:self.position fromNode:parent];
    
    CGFloat offsetX =  (-1.0f + (2.0 * (scenePos.x / scene.size.width)));
    CGFloat offsetY =  (-1.0f + (2.0 * (scenePos.y / scene.size.height)));
    
    CGFloat delta = self.parallaxOffset / (CGFloat)self.children.count;
    
    int childNumber = 0;
    for (SKNode *node in self.children) {
        node.position = CGPointMake(offsetX*delta*childNumber, offsetY*delta*childNumber);
        childNumber++;
    }
}

@end
