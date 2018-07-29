%hook NLGroupMemberInviteViewController
- (void)setButtonsBgView:(UIView *)buttonsBgView { %log; %orig; }
- (UIView *)buttonsBgView { %log; UIView * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setLinkInvitationBackView:(NLLinkInvitaionView *)linkInvitationBackView { %log; %orig; }
- (NLLinkInvitaionView *)linkInvitationBackView { %log; NLLinkInvitaionView * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setQrCodeInvitationView:(NLQRCodeInvitationView *)qrCodeInvitationView { %log; %orig; }
- (NLQRCodeInvitationView *)qrCodeInvitationView { %log; NLQRCodeInvitationView * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setGroupObject:(ManagedGroup *)groupObject { %log; %orig; }
- (ManagedGroup *)groupObject { %log; ManagedGroup * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void).cxx_destruct { %log; %orig; }
- (void)setupInvitationLink:(id)arg1 toGroupOf:(id)arg2 completion:(CDUnknownBlockType)arg3 { %log; %orig; }
- (void)renewInvitationLinkWithCompletion:(CDUnknownBlockType)arg1 { %log; %orig; }
- (void)loadInivitationLinkWithCompletion:(CDUnknownBlockType)arg1 { %log; %orig; }
- (void)close:(id)arg1 { %log; %orig; }
- (void)done:(id)arg1 { %log; %orig; }
- (void)scrollViewWillBeginDragging:(id)arg1 { %log; %orig; }
- (id)viewForLinkInvitation { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)image:(id)arg1 didFinishSavingWithError:(id)arg2 contextInfo:(void *)arg3 { %log; %orig; }
- (id)viewForQRInvitation { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)showInvitationOf:(id)arg1 { %log; %orig; }
- (_Bool)showLinkInvitationBlocked { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)buttonOfFrame:(struct CGRect)arg1 imageViewRuleSet:(id)arg2 title:(id)arg3 isIncludeLeftDivider:(_Bool)arg4 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)viewWillLayoutSubviews { %log; %orig; }
- (void)initButtons { %log; %orig; }
- (void)viewDidLoad { %log; %orig; }
- (void)viewWillAppear:(_Bool)arg1 { %log; %orig; }
- (id)initWithGroupObject:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
%end