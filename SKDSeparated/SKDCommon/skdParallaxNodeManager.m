//
//  skdParallaxNodeManager.m
//  ParallaxTree
//
//  Created by Gyetván András on 20/02/14.
//  Copyright (c) 2014 Developer. All rights reserved.
//

#import "skdParallaxNodeManager.h"

static skdParallaxNodeManager* _instance = NULL;

@implementation skdParallaxNodeManager

- (id) init
{
	self = [super init];
	if(self) {
		self.parallaxNodes = [NSMutableArray array];
	}
	return self;
}

+ (skdParallaxNodeManager*) instance
{
	if(_instance == NULL) {
		_instance = [[skdParallaxNodeManager alloc] init];
	}
	return _instance;
}

@end
