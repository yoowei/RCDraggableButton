//
//  AssistiveTouch.h
//  zjcmcc
//
//  Created by yoowei on 2017/10/16.
//  Copyright © 2017年 sjyyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssistiveTouch : UIWindow
{
    UIButton*_button;
}

-(id) initWithFrame:(CGRect)frame;
@end


//如何使用***
/*
 在AppDelegate.m文件中
 #import"AppDelegate.h"
 #import"AssistiveTouch.h"
 @interfaceAppDelegate()
 {
 //悬浮框
 AssistiveTouch* _Win;
 }
 @end
 @implementation AppDelegate
 
 //设置自定义悬浮框坐标
 -(void)setNew
 {
 _Win= [[AssistiveTouch alloc]initWithFrame:CGRectMake(0,0,60,60)];
 }
 
 - (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
 //这句话很重要，要先将rootview加载完成之后在显示悬浮框，如没有这句话，将可能造成程序崩溃
 [selfperformSelector:@selector(setNew)withObject:nilafterDelay:3];
 [self.windowmakeKeyAndVisible];
 returnYES;
 }
