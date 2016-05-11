# JNPlaceholderTextView

####基于UITextView，增加placeholder功能，增加限制text的输入字数功能
===
###如何使用：

#####使用CocoaPods:
```objc
platform :ios, '8.0'
```

```ruby
pod 'JNPlaceholderTextView'
```

#####导入头文件：

```
#import "JNPlaceholderTextView.h"
```
#####申明变量：

```objc
@property (weak, nonatomic) IBOutlet JNPlaceholderTextView *textView;
```
#####根据需求实现对应功能：

```objc
self.textView.placeholder = @"Hello world";
self.textView.placeholderFontSize = 18.0f;
self.textView.placeholderColor = [UIColor brownColor];
self.textView.maxLimitLength = 10;

```
#####如果不需要换行输入功能，可在UITextViewDelegate中写上如下代码：

```objc
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

```


### 协议（Licenses）
===
- JNPlaceholderTextView 被许可在 MIT 协议下使用。查阅 LICENSE 文件来获得更多信息。