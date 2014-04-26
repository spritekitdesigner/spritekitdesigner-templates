//
//  skdParallaxNodeManager.h
//  ParallaxTree
//

#import <SpriteKit/SpriteKit.h>

//@class skdParallaxNode;

@interface skdParallaxNodeManager : SKSpriteNode
@property (nonatomic, strong) NSMutableArray* parallaxNodes;
+ (skdParallaxNodeManager*) instance;
@end
