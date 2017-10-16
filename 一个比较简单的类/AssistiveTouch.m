//
//  AssistiveTouch.m
//  zjcmcc
//
//  Created by yoowei on 2017/10/16.
//  Copyright © 2017年 sjyyt. All rights reserved.
//

#import "AssistiveTouch.h"
@interface AssistiveTouch()

@end
@implementation AssistiveTouch



-(id)initWithFrame:(CGRect)frame

{
    
    self= [super initWithFrame:frame];
    
    if(self) {
        self.backgroundColor= [UIColor clearColor];
        self.windowLevel=UIWindowLevelAlert+1;
        //这句话很重要
        [self makeKeyAndVisible];
        
        _button= [UIButton buttonWithType:UIButtonTypeCustom];
        
        _button.backgroundColor= [UIColor grayColor];
        
        _button.frame=CGRectMake(0,0, frame.size.width, frame.size.height);
        
        _button.layer.cornerRadius= frame.size.width/2;
        [_button setTitle:@"返回原来APP" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(choose)forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button];
        
        //放一个拖动手势，用来改变控件的位置
        
        UIPanGestureRecognizer*pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(changePostion:)];
        
        [_button addGestureRecognizer:pan];
        
    }
    
    return self;
    
}

//按钮事件
-(void)choose
{
    //正式的功能中会返回那个来源APP
    [_button removeFromSuperview];
    _button=nil;
}

//手势事件 －－ 改变位置

-(void)changePostion:(UIPanGestureRecognizer*)pan

{
    
    CGPoint point = [pan translationInView:self];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    CGRect originalFrame =self.frame;
    
    if(originalFrame.origin.x>=0&& originalFrame.origin.x+originalFrame.size.width<= width) {
        
        originalFrame.origin.x+= point.x;
        
    }
    
    if(originalFrame.origin.y>=0&& originalFrame.origin.y+originalFrame.size.height<= height) {
        
        originalFrame.origin.y+= point.y;
        
    }
    
    self.frame= originalFrame;
    
    [pan setTranslation:CGPointZero inView:self];
    
    if(pan.state==UIGestureRecognizerStateBegan) {
        
        _button.enabled=NO;
        
    }else if(pan.state==UIGestureRecognizerStateChanged){
        
    }else{
        
        CGRect frame =self.frame;
        
        //记录是否越界
        
        BOOL isOver =NO;
        
        if(frame.origin.x<0) {
            
            frame.origin.x=0;
            
            isOver =YES;
            
        }else if(frame.origin.x+frame.size.width> width) {
            
            frame.origin.x= width - frame.size.width;
            
            isOver =YES;
            
        }
        
        if(frame.origin.y<0) {
            
            frame.origin.y=0;
            
            isOver =YES;
            
        }else if(frame.origin.y+frame.size.height> height) {
            
            frame.origin.y= height - frame.size.height;
            
            isOver =YES;
            
        }
        
        if(isOver) {
            
            [UIView animateWithDuration:0.3 animations:^{
                
                self.frame= frame;
                
            }];
            
        }
        
        _button.enabled=YES;
        
    }
    
}

@end

