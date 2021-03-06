//
//  skdParallaxNode.m
//  SKDSeparatedWithOSX
//

#import "skdParallaxNode.h"
#import "skdParallaxNodeManager.h"

@implementation skdParallaxNode
- (id) init
{
	self = [super init];
	if(self) {
		self.parallaxOffset = 75;
		[[skdParallaxNodeManager instance].parallaxNodes addObject:self];
	}
	return self;
}

- (id) initWithParallaxOffset:(float)po
{
	self = [self init];
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
