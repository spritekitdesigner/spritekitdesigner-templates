//
//  skdNodeLibraryDelegate.h
//  SKDSeparatedWithOSX
//

#import <SpriteKit/SpriteKit.h>

@protocol skdNodeLibraryDelegate <NSObject>
@optional
- (id) libraryWillCreateNodeNamed:(NSString*)name;
- (id) libraryWillCreateNodeNamed:(NSString*)name withTexture:(SKTexture*)texture;
- (id) libraryDidCreateNode:(SKNode*)node;
- (void) actionDidFinish:(NSString*)actionName;
@end
