//
//  JNPlaceholderTextView.h
//  https://github.com/Yigol2008/JNPlaceholderTextView
//
//  Created by Yigol on 16/5/3.
//  Copyright © 2016年 Injoinow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JNPlaceholderTextView : UITextView

/**
 *  @brief 占位符文字
 */
@property (nonatomic, strong)  IBInspectable  NSString *placeholder;
/**
 *  @brief 占位符文字颜色，默认：lightGrayColor
 */
@property (nonatomic, strong)  IBInspectable  UIColor *placeholderColor;
/**
 *  @brief 占位符字体大小，默认：systemFontOfSize:14
 */
@property (nonatomic, assign)  IBInspectable  CGFloat placeholderFontSize;

/**
 *  @brief 文本框输入最大字符个数
 */
@property (nonatomic, assign) NSUInteger maxLimitLength;

@end
