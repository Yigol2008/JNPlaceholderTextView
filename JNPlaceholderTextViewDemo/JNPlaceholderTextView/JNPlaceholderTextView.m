//
//  JNPlaceholderTextView.m
//  https://github.com/Yigol2008/JNPlaceholderTextView
//
//  Created by Yigol on 16/5/3.
//  Copyright © 2016年 Injoinow. All rights reserved.
//

#import "JNPlaceholderTextView.h"

static const CGFloat kTopSpace = 8;

@interface JNPlaceholderTextView ()

@property (nonatomic, strong) UILabel *placeholderLabel;

@property (nonatomic, assign) BOOL isSetLimitLength;

@end

IB_DESIGNABLE
@implementation JNPlaceholderTextView

#pragma mark - ************ LifeCycle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.font = [UIFont systemFontOfSize:14];
    
    _placeholderLabel = [[UILabel alloc] init];
    _placeholderLabel.font = [UIFont systemFontOfSize:14];
    _placeholderLabel.textColor = [UIColor lightGrayColor];
    _placeholderLabel.text = @"";
    _placeholderLabel.numberOfLines = 0;
    _placeholderLabel.alpha = 0.5;
    //_placeholderLabel.backgroundColor = [UIColor yellowColor];
    [self addSubview:_placeholderLabel];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChangeNotification:) name:UITextViewTextDidChangeNotification object:self];
    
    _placeholderLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_placeholderLabel
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0
                                                      constant:5]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_placeholderLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:kTopSpace]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_placeholderLabel
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:1.0
                                                      constant:-5]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_placeholderLabel
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationLessThanOrEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1.0
                                                      constant:-kTopSpace]];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - ************ Notifications
- (void)textDidChangeNotification:(NSNotification *)notification
{
    self.placeholderLabel.hidden = self.text.length > 0 ? YES : NO;
    
    if (!self.isSetLimitLength) {
        return;
    }
    
    UITextField *textField = (UITextField *)notification.object;
    NSString *toBeString = textField.text;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    NSString *lang = [[UITextInputMode currentInputMode] primaryLanguage]; // 键盘输入模式
#pragma clang diagnostic pop
    if ([lang isEqualToString:@"zh-Hans"] || [lang isEqualToString:@"zh-Hant"]) {
        // 简体中文输入，包括简体拼音，简体五笔，简体手写(zh-Hans)
        // 繁体中文输入，包括繁体拼音，繁体五笔，繁体手写(zh-Hant)
        UITextRange *selectedRange = [textField markedTextRange];
        // 获取高亮部分（联想部分）
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有联想，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (toBeString.length > self.maxLimitLength) {
                textField.text = [toBeString substringToIndex:self.maxLimitLength];
            }
        } else {
            // 有联想，则暂不对联想的文字进行统计
        }
    } else {// 中文输入法以外的直接对其统计限制即可，暂时不考虑其他语种情况
        if (toBeString.length > self.maxLimitLength) {
            textField.text = [toBeString substringToIndex:self.maxLimitLength];
        }
    }
}

#pragma mark - ************ Setter
- (void)setText:(NSString *)text
{
    [super setText:text];
    if (text.length > 0) {
        _placeholderLabel.hidden = YES;
    }
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    _placeholderLabel.text = placeholder;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    _placeholderLabel.textColor = placeholderColor;
}

- (void)setPlaceholderFontSize:(CGFloat)placeholderFontSize
{
    _placeholderFontSize = placeholderFontSize;
    _placeholderLabel.font = [UIFont systemFontOfSize:placeholderFontSize];
    self.font = [UIFont systemFontOfSize:placeholderFontSize];
}

- (void)setMaxLimitLength:(NSUInteger)maxLimitLength
{
    _maxLimitLength = maxLimitLength;
    _isSetLimitLength = YES;
}

@end
