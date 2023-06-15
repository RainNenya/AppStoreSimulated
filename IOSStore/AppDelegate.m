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
    
    
    //这里你使用的是系统自带的样式，UITabBarSystemItemFeatured、UITabBarSystemItemBookmarks这几个都是，但实际上真实项目里肯定都是用的自定义的样式，你可以参考以下代码试试看把这四个tabbar用自定义样式再实现一下
    /*
    vc.tabBarItem.title = 标题;
    vc.tabBarItem.image = [UIImage imageNamed:@"显示的图片名"];//图片保存在Assets中
    vc.tabBarItem.selectedImage = [UIImage imageNamed:@"选中情况下显示的图片名"];//上一句是未选中的情况下显示的图片，这里是选中情况下显示的图片
    self.tabBar.tintColor=[UIColor colorNamed:@"Color_text"];//IOS13以后必须设置这个
    
    //这两句是调整图片和标题的间距
    vc.tabBarItem.imageInsets = UIEdgeInsetsZero;
    vc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2);
    */
    /*
     除了上了写的，自定义tabBar还可以设置一些其他内容，具体的你可以按住command，然后点击tabBar.后面的任意一个参数，比方说titlePositionAdjustment，就可以跳转到oc源代码对应的页面，苹果对每一个方法或参数都有详细的注释，可以翻译一下
     */
    
    
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
