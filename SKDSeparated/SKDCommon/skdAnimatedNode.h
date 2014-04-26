//
//  skdAnimatedNode.h
//  ParallaxTree
//

#import <SpriteKit/SpriteKit.h>

@interface skdAnimatedNode : SKSpriteNode
@property (nonatomic) NSString* atlasName;
@property (nonatomic) NSTimeInterval timePerFrame;
@property (nonatomic) BOOL enabled;
@property (strong) SKAction* animationAction;
@end
