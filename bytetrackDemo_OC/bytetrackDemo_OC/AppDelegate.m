//
//  AppDelegate.m
//  bytetrackDemo_OC
//
//  Created by 孙良 on 2022/9/2.
//

#import "AppDelegate.h"
#import <Bytetrack/Bytetrack.h>
@interface AppDelegate ()

#warning 特别说明:该demo仅供参考，demo中引用的bytetrackSDK不一定是最新版本，如您想体验最新版本，在您下载后可以执行pod update bytetrack命令升级版本，版本记录请查看https://github.com/byte-track/bytetrack-sdk-iOS/releases



#warning 此处要替换为你在bytetrack后台申请的真实apiKey和appId

#define apiKey @"YOUR API KEY" //apiKey
#define appId  @"YOUR APP ID" //appId



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
   
    [Bytetrack initMessengerWithApiKey:apiKey forAppId:appId withUserId:nil withPhone:nil withEmail:nil withLanguage:nil withgroupId:nil withPrivateServerURL:nil];//初始化SDK
    [Bytetrack setLanguage:1];//设置语言
    [Bytetrack setLauncherVisible:YES];//显示悬浮图标，默认不显示
    NSString*verison= [Bytetrack getSDKVersion];
    
    NSLog(@"此SDK版本号是--%@",verison);
    
    
    return YES;
}


#pragma mark - UISceneSession lifecycle



#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"bytetrackDemo_OC"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
