//
//  PlaceholderTextView.m
//  PlaceholderTextView
//
//  Created by 赵进雄 on 15/2/11.
//  Copyright (c) 2015年 zhaojinxiong. All rights reserved.
//

#import "PlaceholderTextView.h"

#define LIMIT_SIZE 40

@implementation PlaceholderTextView

- (id) initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self initTextView];
    }
    return self;
}

- (void)initTextView
{
    float left=5,top=2,hegiht=30;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DidChange:) name:UITextViewTextDidChangeNotification object:self];
    
    self.placeholderColor = [UIColor lightGrayColor];
    _PlaceholderLabel=[[UILabel alloc] initWithFrame:CGRectMake(left, top
                                                                , CGRectGetWidth(self.frame)-2*left, hegiht)];
    _PlaceholderLabel.font = self.placeholderFont?self.placeholderFont:self.font;
    _PlaceholderLabel.textColor = self.placeholderColor;
    _PlaceholderLabel.text = self.placeholder;
    [self addSubview:_PlaceholderLabel];
    
    _limitLabel = [[UILabel alloc]init];
    _limitLabel.frame = CGRectMake(self.frame.size.width - 68, self.frame.size.height-25, 70, 20);
    _limitLabel.textColor = [UIColor grayColor];
    _limitLabel.font = [UIFont systemFontOfSize:14.f];
    _limitLabel.text = [NSString stringWithFormat:@"0/%d",LIMIT_SIZE];
    _limitLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_limitLabel];
    
}

-(void)setPlaceholder:(NSString *)placeholder{
    if (placeholder.length == 0 ) {
        _PlaceholderLabel.hidden=YES;
    }
    else
    {
        _PlaceholderLabel.text=placeholder;
        _placeholder=placeholder;
    }
}

-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    _PlaceholderLabel.textColor=placeholderColor;
    _placeholderColor=placeholderColor;
}

-(void)setPlaceholderFont:(UIFont *)placeholderFont{
    _PlaceholderLabel.font=placeholderFont;
    _placeholderFont=placeholderFont;
}

#pragma mark---一些通知
-(void)DidChange:(NSNotification*)noti{
    
    UITextRange *markRange = self.markedTextRange;
    NSInteger pos = [self offsetFromPosition:markRange.start
                                      toPosition:markRange.end];
    NSInteger nLength = self.text.length - pos;
    
    if (nLength > LIMIT_SIZE && pos == 0)
    {
        _limitLabel.text = [NSString stringWithFormat:@"%d/%d",LIMIT_SIZE,LIMIT_SIZE];
        self.text = [self.text substringWithRange:NSMakeRange(0, 40)];
    }
    else if(nLength <= LIMIT_SIZE && pos == 0)
    {
        _limitLabel.text = [NSString stringWithFormat:@"%lu/%d",(unsigned long)[self.text length],LIMIT_SIZE];
    }
    

    if (self.placeholder.length == 0) {
        _PlaceholderLabel.hidden=YES;
    }
    
    if (self.text.length > 0) {
        _PlaceholderLabel.hidden=YES;
    }
    else{
        _PlaceholderLabel.hidden=NO;
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
