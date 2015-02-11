//
//  PlaceholderTextView.h
//  PlaceholderTextView
//
//  Created by 赵进雄 on 15/2/11.
//  Copyright (c) 2015年 zhaojinxiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceholderTextView : UITextView

@property(copy,nonatomic)   NSString *placeholder;
@property(strong,nonatomic) UIColor *placeholderColor;
@property(strong,nonatomic) UIFont * placeholderFont;
@property(assign,nonatomic) float updateHeight;
@property(strong,nonatomic)  UILabel *PlaceholderLabel;
@property (nonatomic, retain) UILabel *limitLabel;

//最大长度设置
@property(assign,nonatomic) NSInteger maxTextLength;

@end
