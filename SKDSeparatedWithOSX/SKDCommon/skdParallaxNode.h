//
//  skdParallaxNode.h
//  SKDSeparatedWithOSX
//

#import <SpriteKit/SpriteKit.h>

@interface skdParallaxNode : SKNode
@property (nonatomic) float parallaxOffset;
- (id) initWithParallaxOffset:(float)po;
- (void) update;
- (void)updateOffset;
@end
