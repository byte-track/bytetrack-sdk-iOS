//
//  AppDelegate.h
//  bytetrackDemo_OC
//
//  Created by 孙良 on 2022/9/2.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;
- (void)saveContext;
@property(strong, nonatomic) UIWindow *window;


@end

