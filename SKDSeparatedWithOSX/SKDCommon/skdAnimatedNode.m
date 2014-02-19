//
//  skdAnimatedNode.m
//  ParallaxTree
//
//  Created by Gyetván András on 19/02/14.
//  Copyright (c) 2014 Developer. All rights reserved.
//

#import "skdAnimatedNode.h"

@interface skdAnimatedNode(Private)
- (void) startAnimation;
- (void) stopAnimation;
- (void) createAnimation;
@end

@implementation skdAnimatedNode
@synthesize enabled = _enabled;
@synthesize atlasName = _atlasName;
@synthesize timePerFrame = _timePerFrame;

- (id) init
{
	self = [super init];
	if(self) {
		_enabled = false;
	}
	return self;
}

- (void) setEnabled:(BOOL)e
{
	if(_enabled == e) return;
	_enabled = e;
	if(_enabled) [self startAnimation];
	else [self stopAnimation];
}

- (void) setAtlasName:(NSString *)atlasName
{
	if([atlasName isEqualToString:_atlasName]) return;
	_atlasName = atlasName;
	[self createAnimation];
}

- (void) setTimePerFrame:(NSTimeInterval)timePerFrame
{
	if(_timePerFrame == timePerFrame) return;
	_timePerFrame = timePerFrame;
	[self createAnimation];
}

- (void) createAnimation
{
	[self stopAnimation];
	if(_atlasName == NULL) return;
	SKTextureAtlas* atlas = [SKTextureAtlas atlasNamed:_atlasName];
	NSArray* frameNames = [atlas.textureNames sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
	if(frameNames.count == 0) return;
	NSMutableArray* textures = [NSMutableArray array];
	BOOL needToSetTexture = YES;
	for(NSString* frameName in frameNames) {
		SKTexture* tex = [atlas textureNamed:frameName];
		[textures addObject:tex];
		if(needToSetTexture) {
			self.texture = tex;
			self.size = tex.size;
			needToSetTexture = NO;
		}
	}
	SKAction* a = [SKAction animateWithTextures:textures timePerFrame:_timePerFrame];
	SKAction* r = [SKAction repeatActionForever:a];
	self.animationAction = r;
	if(_enabled) [self startAnimation];
}

- (void) startAnimation
{
	if(!_enabled) return;
	if(self.animationAction) {
		[self runAction:self.animationAction withKey:@"_animation_action_"];
	}
}

- (void) stopAnimation
{
	[self removeActionForKey:@"_animation_action_"];
}
@end
