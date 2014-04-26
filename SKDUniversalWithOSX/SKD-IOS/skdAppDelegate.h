//
//  skdAppDelegate.h
//  SKDUniversal
//

#import <UIKit/UIKit.h>
#import "skdNodeLibrary.h"

@interface skdAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (weak) IBOutlet skdNodeLibrary *nodeLibrary;

@end
