//
//  skdNodeLibrary.h
//  SKDUniversal
//
//  Created by Gyetván András on 28/12/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "skdNodeDelegate.h"
#import "skdNodeLibraryDelegate.h"
#pragma mark -
#pragma mark Node Librry

@interface skdNodeLibrary : NSObject
@property (weak, nonatomic) IBOutlet SKView *skView;
@property BOOL isIPhone;
@property BOOL isIPhone4;
@property BOOL isIPhone35;
@property BOOL isIPad;
@property BOOL isIPadHD;
@property BOOL isOSX;
@property NSString* platformPrefix;
@property NSString* positionPrefix;
@property NSDictionary* nodePositions;
@property id<skdNodeLibraryDelegate>delegate;

- (SKScene*) createSceneByName:(NSString *)name withSize:(CGSize) size andDelegate:(id<skdNodeDelegate>)delegate;
- (SKScene*) createSceneByName:(NSString *)name andDelegate:(id<skdNodeDelegate>)delegate;
- (SKNode*) createGameObjectByName:(NSString*)name;
- (SKNode*) createGameObjectByName:(NSString*)name andDelegate:(id<skdNodeDelegate>)delegate;
- (SKAction*) createActionForNode:(SKNode *) node byName:(NSString*)name;
@end

#pragma mark -
#pragma mark SKD Protocol
#pragma mark SKNode(SKD)
@interface SKNode(SKD)
@property id<skdNodeDelegate> delegate;
@end

@interface skdScene : SKScene
@property (nonatomic) NSMutableArray* parallaxNodes;
@end

//#pragma mark SKScene(SKD)
//@interface SKScene(SKD)
//@property (strong) id<skdNodeDelegate> delegate;
//@end
//
//#pragma mark SKSpriteNode(SKD)
//@interface SKSpriteNode(SKD)
//@property id<skdNodeDelegate> delegate;
//@end
//
//#pragma mark SKVideoNode
//@interface SKVideoNode(SKD)
//@property id<skdNodeDelegate> delegate;
//@end
//
//#pragma mark SKLabelNode
//@interface SKLabelNode(SKD)
//@property id<skdNodeDelegate> delegate;
//@end
//
//#pragma mark SKShapeNode(SKD)
//@interface SKShapeNode(SKD)
//@property id<skdNodeDelegate> delegate;
//@end
//
//#pragma mark SKEmitterNode
//@interface SKEmitterNode(SKD)
//@property id<skdNodeDelegate> delegate;
//@end
//
//#pragma mark SKCropNode(SKD)
//@interface SKCropNode(SKD)
//@property id<skdNodeDelegate> delegate;
//@end
//
//#pragma mark SKDEffectNode
//@interface SKDEffectNode : SKEffectNode
//@property id<skdNodeDelegate> delegate;
//@end
