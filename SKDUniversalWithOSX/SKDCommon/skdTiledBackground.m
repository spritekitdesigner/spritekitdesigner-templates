//
//  skdTiledBackground.m
//  Cogs
//

#import "skdTiledBackground.h"

@implementation skdTiledBackground
- (id)initWithAtlasNamed:(NSString*)atlasName size:(CGSize)size gridSize:(CGSize)gridSize
{
	self = [super init];
	if(self) {
		SKTextureAtlas* atlas = [SKTextureAtlas atlasNamed:atlasName];
		int col = size.width/gridSize.width;
		int row = size.height/gridSize.height;
		int midX = size.width/2;
		int midY = size.height/2;
		for(int y = 0; y < row;y++) {
			for(int x = 0; x < col;x++) {
				int j = (y * col) + x;
				float px = (float)x * gridSize.width;
				float py = (float)y * gridSize.height;
				py = size.height - py - midY;
				px = px - midX;
				px += (gridSize.width/2);
				py -= (gridSize.height/2);
				NSString* texName = [NSString stringWithFormat:@"%@-%d",atlasName,j];
				SKTexture* tex = [atlas textureNamed:texName];
				SKSpriteNode *tile = [SKSpriteNode spriteNodeWithTexture:tex];
				tile.position = CGPointMake(px, py);
				[self addChild:tile];
			}
		}
	}
	return self;
}

@end
