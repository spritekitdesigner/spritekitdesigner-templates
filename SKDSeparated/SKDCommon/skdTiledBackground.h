//
//  skdTiledBackground.h
//  Cogs
//
//  Created by Gyetván András on 29/01/14.
//  Copyright (c) 2014 Developer. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface skdTiledBackground : SKNode
- (id)initWithAtlasNamed:(NSString*)atlasName size:(CGSize)size gridSize:(CGSize)gridSize;
@end
