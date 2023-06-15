//
//  AppDelegate.m
//  IOSStore
//
//  Created by Percy on 2023/4/22.
//

#import "AppDelegate.h"
#import "TodayPageController.h"
#import "GamePageController.h"
#import "AppPageController.h"
#import "SearchPageController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    
    TodayPageController *todayPage = [[TodayPageController alloc]init];
    //todayPage.view.backgroundColor = [UIColor redColor];
    todayPage.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:0];
    [todayPage.tabBarItem setValue:@"Today" forKey:@"internalTitle"];
    UINavigationController *todayNav = [[UINavigationController alloc]initWithRootViewController:todayPage];
    
    GamePageController *gamePage = [[GamePageController alloc]init];
    //gamePage.view.backgroundColor = [UIColor greenColor];
    gamePage.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:1];
    [gamePage.tabBarItem setValue:@"游戏" forKey:@"internalTitle"];
    UINavigationController *gameNav = [[UINavigationController alloc]initWithRootViewController:gamePage];
    
    AppPageController *appPage = [[AppPageController alloc]init];
    //appPage.view.backgroundColor = [UIColor yellowColor];
    appPage.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemMostViewed tag:2];
    [appPage.tabBarItem setValue:@"APP" forKey:@"internalTitle"];
    UINavigationController *appNav = [[UINavigationController alloc]initWithRootViewController:appPage];
    
    SearchPageController *searchPage = [[SearchPageController alloc]init];
    //searchPage.view.backgroundColor = [UIColor whiteColor];
    searchPage.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemSearch tag:3];
    [searchPage.tabBarItem setValue:@"搜索" forKey:@"internalTitle"];
    UINavigationController *searchNav = [[UINavigationController alloc]initWithRootViewController:searchPage];
    
    UITabBarController *tab = [[UITabBarController alloc]init];
    tab.viewControllers = @[todayNav, gameNav, appNav, searchNav];
    self.window.rootViewController = tab;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
