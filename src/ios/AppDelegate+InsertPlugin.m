#import "AppDelegate+InsertPlugin.h"
#import <objc/runtime.h>
#import <InsertFramework/InsertFramework.h>

@implementation AppDelegate (InsertPlugin)

//Method swizzling
+ (void)load
{
    Method original =  class_getInstanceMethod(self, @selector(application:didFinishLaunchingWithOptions:));
    Method custom =    class_getInstanceMethod(self, @selector(application:insertDidFinishLaunchingWithOptions:));
    Method original_open =  class_getInstanceMethod(self, @selector(application:openURL:sourceApplication:annotation:));
    Method custom_open =    class_getInstanceMethod(self, @selector(application:insertOpenURL:sourceApplication:annotation:));
    method_exchangeImplementations(original, custom);
    method_exchangeImplementations(original_open, custom_open);
}

- (BOOL)application:(UIApplication *)application insertDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSString *APIKey = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"Insert IOS Key"];
    NSString *COMPANYNAME = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"Company Name"];
    [[InsertManager sharedManager] initSDK:APIKey
                           companyName: COMPANYNAME 
                            initParams: nil];
    [self application:application insertDidFinishLaunchingWithOptions:launchOptions];
    return YES;
}

- (BOOL)application:(UIApplication *)application insertOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
     if ([[url scheme] containsString:@"insert"]) {
        [[InsertManager sharedManager] initWithUrl:url];
         return YES;
     }
    [self application:application insertOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    return YES;
}
@end
