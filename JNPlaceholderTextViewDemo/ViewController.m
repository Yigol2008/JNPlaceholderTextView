//
//  ViewController.m
//  JNPlaceholderTextViewDemo
//
//  Created by Yigol on 16/5/3.
//  Copyright © 2016年 Injoinow. All rights reserved.
//

#import "ViewController.h"
#import "JNPlaceholderTextView.h"

@interface ViewController ()<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet JNPlaceholderTextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    self.textView.placeholder = @"hehe";
//    self.textView.placeholderFontSize = 18.0f;
//    self.textView.placeholderColor = [UIColor brownColor];
    
    self.textView.maxLimitLength = 10;
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
