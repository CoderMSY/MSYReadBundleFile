//
//  MSYFilePreviewController.m
//
//
//  Created by Simon Miao on 2021/12/2.
//  Copyright © 2021 SimonMiao. All rights reserved.
//

#import "MSYFilePreviewController.h"
#import <QuickLook/QuickLook.h>
#import <Masonry/Masonry.h>

@interface MSYFilePreviewController () <QLPreviewControllerDataSource, QLPreviewControllerDelegate>

@property (nonatomic,strong) QLPreviewController *previewCtr;

@end

@implementation MSYFilePreviewController

#pragma mark - lifecycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addChildViewController:self.previewCtr];
    [self.previewCtr didMoveToParentViewController:self];
    [self.view addSubview:self.previewCtr.view];
    
    [self.previewCtr.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

//是否自动旋转,返回YES可以自动旋转,返回NO禁止旋转
- (BOOL)shouldAutorotate {
    return YES;
}

//返回支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

//由模态推出的视图控制器 优先支持的屏幕方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}

#pragma mark - public methods

#pragma mark - private methods

#pragma mark  QLPreviewControllerDelegate

//- (BOOL)previewController:(QLPreviewController *)controller shouldOpenURL:(NSURL *)url forPreviewItem:(id <QLPreviewItem>)item{
//    return YES;
//}

#pragma mark - QLPreviewControllerDataSource

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller {
    if (!self.filePath) {
        return 0;
    }
    return 1;
}

- (id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index {
    return [NSURL fileURLWithPath:self.filePath];
}

#pragma mark - getter && setter

- (QLPreviewController *)previewCtr {
    if (!_previewCtr) {
        _previewCtr = [[QLPreviewController alloc] init];
        _previewCtr.delegate = self;
        _previewCtr.dataSource = self;
        _previewCtr.view.backgroundColor = [UIColor clearColor];
    }
    return _previewCtr;
}

@end
