#import "AppDelegate+InsertPlugin.h"
#import <objc/runtime.h>
#import <InsertFramework/InsertFramework.h>

@implementation AppDelegate (InsertPlugin)

//Method swizzling
+ (void)load
{
    Method original =  class_getInstanceMethod(self, @selector(application:didFinishLaunchingWithOptions:));
    Method custom =    class_getInstanceMethod(self, @selector(application:insertDidFinishLaunchingWithOptions:));
    method_exchangeImplementations(original, custom);
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

- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options;
{
    if ([[url scheme] containsString:@"insert"]) {
        [[InsertManager sharedManager] initWithUrl:url];
        return YES;
    }

    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
     if ([[url scheme] containsString:@"insert"]) {
        [[InsertManager sharedManager] initWithUrl:url];
        return YES;
    }
    return YES;
}
@end
