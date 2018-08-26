#import <Foundation/NSObject.h>
@interface NLGroupMemberInviteViewController:UIView
@property(retain, nonatomic) UIView *view;
- (void)initButtons;
@end
bool flag = true;
float y = 0;
static NSString *cmstoken = @"";
%hook NLGroupMemberInviteViewController
- (void)viewDidLoad
{
  %orig;
  [self initButtons];
  UIView *ui = MSHookIvar<UIView *>(self, "_buttonsBgView");
  CGRect dev_size = [[UIScreen mainScreen] bounds];
  y = ui.center.y;
  UILongPressGestureRecognizer *longPushGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
  [self.view addGestureRecognizer:longPushGesture];
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
-(void)longPress:(UIGestureRecognizer *)sender {
  if (sender.state == UIGestureRecognizerStateBegan){
      flag = !flag;
  }
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
        view.center = CGPointMake(10000, 10000);
      }
    }
  }
  //}
}
%end


@interface ChatID
-(id)mid;
@end
@interface MessageViewController{}
- (void)sendMessageWithText:(NSString *)arg1 sendSingleSticonAsSticker:(_Bool)arg2 metadata:(id)arg3;
- (id)chatID;
@end

%hook MessageViewController
- (void)sendMessageWithText:(NSString *)arg1 sendSingleSticonAsSticker:(_Bool)arg2 metadata:(id)arg3
{
	%orig;
	NSDictionary *dic = @{};
	if([arg1 isEqualToString: @"test"]){
		[self sendMessageWithText:@"testok" sendSingleSticonAsSticker:0 metadata:dic];
	}
	if([arg1 isEqualToString: @"Hello"]){
		[self sendMessageWithText:@"こんにちは" sendSingleSticonAsSticker:0 metadata:dic];
	}
	if([arg1 isEqualToString: @"id"]){
		ChatID *chatid = MSHookIvar<ChatID *>(self, "chatID");
		NSString *_mid = [chatid mid];
		NSString *l = [NSString stringWithFormat:@"%@", _mid];
		[self sendMessageWithText:l sendSingleSticonAsSticker:0 metadata:dic];
	}
}
%end

%hook LineOperation
- (NSInteger)type
{
  NSInteger __type = %orig;
  //NSLog(@"OpType:%d",int(__type));
  if(__type == 65)
    __type = 9999;
  return __type;
}
%end

%hook LEGYRequestResponseHandler
- (id) requestData
{
  NSDictionary *headerFields = MSHookIvar<NSDictionary *>(self, "_headerFields");
  NSArray *keys = [headerFields allKeys];
  if([keys containsObject:@"X-CMSToken"]){
    cmstoken = [headerFields objectForKey:@"X-CMSToken"];
    NSLog(@"X-CMSToken:%@", cmstoken);

  }
  return %orig;
}
%end
