#import <Foundation/NSObject.h>
@interface NLGroupMemberInviteViewController:UIView
@property(retain, nonatomic) UIView *view;
- (void)initButtons;
@end
bool flag = true;
float y = 0;
%hook NLGroupMemberInviteViewController
- (void)viewDidLoad
{
  %orig;
  [self initButtons];
  UIView *ui = MSHookIvar<UIView *>(self, "_buttonsBgView");
  CGRect dev_size = [[UIScreen mainScreen] bounds];
  y = ui.center.y;
  UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
  doubleTapGesture.numberOfTapsRequired = 2;
  [self.view addGestureRecognizer:doubleTapGesture];
  NSArray *views = [self.view subviews];
  for(UIView *view in views)
  {
    NSString *class_name = NSStringFromClass([view class]);
    if ([@"UIView" isEqualToString:class_name]) {
      view.center = CGPointMake(dev_size.size.width/2, y);
      view.backgroundColor = [UIColor blackColor];
    }
  }
}

%new
-(void)handleDoubleTap:(UIGestureRecognizer *)sender {
  if (sender.state == UIGestureRecognizerStateEnded){
    NSLog(@"linne");
    NSArray *views = [self.view subviews];
    for(UIView *view in views)
    {
      NSString *class_name = NSStringFromClass([view class]);
      if ([@"UIView" isEqualToString:class_name]) {
        if(flag){
          CGRect dev_size = [[UIScreen mainScreen] bounds];
          view.backgroundColor = [UIColor blackColor];
          view.center = CGPointMake(dev_size.size.width/2, y);;
        } else {
          UIColor *color = [UIColor colorWithRed:0.0 green:0 blue:0 alpha:0];
          view.backgroundColor = color;
          view.center = CGPointMake(1000, 1000);
        }
      }
    }
  }
  flag = !flag;
}
%end
