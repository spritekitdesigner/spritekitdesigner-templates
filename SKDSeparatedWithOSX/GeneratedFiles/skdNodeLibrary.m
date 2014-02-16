//
//  skdNodeLibrary.m
//  SKDUniversal
//
//  Created by Gyetván András on 28/12/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import "skdNodeLibrary.h"
#import <objc/runtime.h>
#import "skdParallaxNode.h"
#include "skdTiledBackground.h"

#import "skdDefines.h"

#pragma mark -
#pragma mark Helper Functions

#if defined(__MAC_OS_X_VERSION_MAX_ALLOWED)
CGPoint CGPointFromString(NSString* theString)
{
	NSPoint cocoaPoint = NSPointFromString(theString);
	CGPoint point = NSPointToCGPoint(cocoaPoint);
	return point;
}

NSString * NSStringFromCGPoint(CGPoint point)
{
	NSPoint cocoaPoint = NSPointFromCGPoint(point);
	NSString* ret = NSStringFromPoint(cocoaPoint);
	return ret;
}
#endif

#pragma mark -
#pragma mark Node Librry Private Interface
@interface skdNodeLibrary(Private)
- (void) setupPrefixes;
- (SKTexture*) textureWithName:(NSString*)name;
- (CGPoint) nodePositionByName:(NSString*)name;
@end

@implementation skdNodeLibrary(Private)
- (void) setupPrefixes
{
	self.platformPrefix = @"";
	self.isUniversal = false;
#if defined(SKD_UNIVERSAL_BUILD)
	self.positionPrefix = @"iOSUniversal";
	self.isUniversal = true;
#else
	if(self.isIPhone4) {
		self.platformPrefix = @"";
		self.positionPrefix = @"iPhone4";
	} else if(self.isIPhone35) {
		self.platformPrefix = @"";
		self.positionPrefix = @"iPhone35";
	} else if(self.isIPad) {
		self.platformPrefix = @"";
		self.positionPrefix = @"iPad";
	} else if(self.isIPadHD) {
		self.platformPrefix = @"";
		self.positionPrefix = @"iPad";
	}
#endif
	if(self.isOSX) {
		self.platformPrefix = @"";
		self.positionPrefix = @"OSX";
	}
}

- (SKTexture*) textureWithName:(NSString*)name
{
	SKTexture* ret = NULL;
	NSArray *listItems = [name componentsSeparatedByString:@"/"];
	if(listItems.count == 2) {
		NSString* atlasName = [listItems objectAtIndex:0];
		NSString* textureName = [listItems objectAtIndex:1];
		SKTextureAtlas* atlas = [SKTextureAtlas atlasNamed:atlasName];
		ret = [atlas textureNamed:textureName];
	} else {
		NSString* imageName = name;
		ret = [SKTexture textureWithImageNamed:imageName];
	}
	return ret;
}


- (CGPoint) nodePositionByName:(NSString*)name
{
	NSString* key = [NSString stringWithFormat:@"%@.%@",name,self.positionPrefix];
	NSString* pos = [self.nodePositions valueForKeyPath:key];
	CGPoint pt = CGPointFromString(pos);
	return pt;
}

@end

#pragma mark -
#pragma mark Node Library

@implementation skdNodeLibrary

- (id) init
{
	self = [super init];
	if(self) {
		self.isIPhone4 = FALSE;
		self.isIPhone35 = FALSE;
		self.isIPhone = FALSE;
		self.isIPad = FALSE;
		self.isIPadHD = FALSE;
		self.isOSX = FALSE;
#if defined(__IPHONE_OS_VERSION_MAX_ALLOWED)
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
			self.isIPhone4 = ([UIScreen mainScreen].bounds.size.height == 568.0);
			self.isIPhone35 = !self.isIPhone4;
			self.isIPhone = TRUE;
		} else {
			CGFloat scale = [[UIScreen mainScreen] scale];
			self.isIPad = TRUE;
			self.isIPadHD = scale > 1;
		}
#else
		self.isOSX = TRUE;
#endif
		[self setupPrefixes];
		
		NSBundle *thisBundle = [NSBundle bundleForClass:[self class]];
		NSString *node_position_path = NULL;
		if ((node_position_path = [thisBundle pathForResource:@"skd_node_positions" ofType:@"plist"]))  {
			self.nodePositions = [[NSDictionary alloc] initWithContentsOfFile:node_position_path];
		}
	}
	return self;
}

- (SKScene*) createSceneByName:(NSString *)name andDelegate:(id<skdNodeDelegate>)delegate
{
	return [self createSceneByName:name withSize:self.skView.bounds.size andDelegate:delegate];
}

- (SKScene*) createSceneByName:(NSString *)name withSize:(CGSize) size andDelegate:(id<skdNodeDelegate>)delegate
{
	SKScene* ret = NULL;
#pragma mark Begin Scene Creation Code
//	CGSize size = CGSizeMake(w, h);
//	if(self.isOSX) {
//		
//	} else if(self.isIPhone) {
//		
//	} else if(self.isIPad) {
//		
//	}
#include "skdScenes.inc"
	
#pragma mark End Scene Creation Code
	if(ret != NULL) {
		if(self.isOSX) {
			ret.scaleMode = SKSceneScaleModeAspectFit;
		} else {
			ret.scaleMode = SKSceneScaleModeAspectFill;
		}
		ret.name = name;
		ret.delegate = delegate;
	}
	return ret;
}

- (SKNode*) createGameObjectByName:(NSString*)name andDelegate:(id<skdNodeDelegate>)delegate
{
	SKNode* ret = NULL;
#pragma mark Begin Game Object Creation Code
	
#include "skdGameObjects.inc"
	
#pragma mark End Game Object Creation Code
	
	if(ret != NULL) {
		ret.name = name;
		ret.delegate = delegate;
	}
	return ret;
}

- (SKNode*) createGameObjectByName:(NSString*)name
{
	return [self createGameObjectByName:name andDelegate:NULL];
}

- (SKAction*) createActionForNode:(SKNode *) node byName:(NSString*)name
{
	SKAction* ret = NULL;
#pragma mark Begin Action Creation Code

#include "skdActions.inc"
	
#pragma mark End Action Creation Code
	return ret;
}

@end

@implementation skdScene
- (id) initWithSize:(CGSize)size
{
	self = [super initWithSize:size];
	if(self) {
		self.parallaxNodes = [NSMutableArray array];
	}
	return self;
}
- (void)didSimulatePhysics
{
	for(skdParallaxNode* pn in self.parallaxNodes) {
		[pn update];
	}
}
@end

#pragma mark -
#pragma mark SKD Protocol

#define ADD_DYNAMIC_PROPERTY(PROPERTY_TYPE,PROPERTY_NAME,SETTER_NAME) \
@dynamic PROPERTY_NAME ; \
- ( PROPERTY_TYPE ) PROPERTY_NAME \
{ \
return ( PROPERTY_TYPE ) objc_getAssociatedObject(self, @selector(PROPERTY_NAME ) ); \
} \
\
- (void) SETTER_NAME :( PROPERTY_TYPE ) PROPERTY_NAME \
{ \
objc_setAssociatedObject(self, @selector(PROPERTY_NAME) , PROPERTY_NAME , OBJC_ASSOCIATION_RETAIN); \
} \

#if defined(__IPHONE_OS_VERSION_MAX_ALLOWED)

#define ADD_OVERRIDES \
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {\
	if ([self.delegate respondsToSelector:@selector(touchesBegan:withEvent:on:)]) {\
		[self.delegate touchesBegan:touches withEvent:event on:self];\
	}\
}\
- (BOOL) isUserInteractionEnabled\
{\
	return self.delegate != NULL;\
}\

#else

#define ADD_OVERRIDES \
-(void)mouseDown:(NSEvent *)theEvent {\
	if ([self.delegate respondsToSelector:@selector(mouseDown:on:)]) {\
		[self.delegate mouseDown:theEvent on:self];\
	}\
}\
- (BOOL) isUserInteractionEnabled\
{\
	return self.delegate != NULL;\
}\

#endif

#pragma mark SKNode(SKD)
@implementation SKNode(SKD)
ADD_DYNAMIC_PROPERTY(id<skdNodeDelegate>,delegate,setDelegate)
ADD_OVERRIDES
@end

//@implementation SKScene(SKD)
//ADD_DYNAMIC_PROPERTY(id<skdNodeDelegate>,delegate,setDelegate)
//ADD_OVERRIDES
//@end
//
//#pragma mark SKSpriteNode(SKD)
//@implementation SKSpriteNode(SKD)
//ADD_DYNAMIC_PROPERTY(id<skdNodeDelegate>,delegate,setDelegate)
//ADD_OVERRIDES
//@end
//
//#pragma mark SKVideoNode
//@implementation SKVideoNode(SKD)
//ADD_DYNAMIC_PROPERTY(id<skdNodeDelegate>,delegate,setDelegate)
//ADD_OVERRIDES
//@end
//
//#pragma mark SKLabelNode
//@implementation SKLabelNode(SKD)
//ADD_DYNAMIC_PROPERTY(id<skdNodeDelegate>,delegate,setDelegate)
//@end
//
//#pragma mark SKShapeNode(SKD)
//@implementation SKShapeNode(SKD)
//ADD_DYNAMIC_PROPERTY(id<skdNodeDelegate>,delegate,setDelegate)
//ADD_OVERRIDES
//@end
//
//#pragma mark SKEmitterNode
//@implementation SKEmitterNode(SKD)
//ADD_DYNAMIC_PROPERTY(id<skdNodeDelegate>,delegate,setDelegate)
//ADD_OVERRIDES
//@end
//
//#pragma mark SKCropNode(SKD)
//@implementation SKCropNode(SKD)
//ADD_DYNAMIC_PROPERTY(id<skdNodeDelegate>,delegate,setDelegate)
//ADD_OVERRIDES
//@end

