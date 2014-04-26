//
//  skdTiledBackground.h
//  Cogs
//

#import <SpriteKit/SpriteKit.h>

@interface skdTiledBackground : SKNode
- (id)initWithAtlasNamed:(NSString*)atlasName size:(CGSize)size gridSize:(CGSize)gridSize;
@end
