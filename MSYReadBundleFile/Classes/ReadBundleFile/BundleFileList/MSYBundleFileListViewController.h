//
//  MSYBundleFileListViewController.h
//  MSYReadBundleFile
//
//  Created by Simon Miao on 2021/12/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MSYBundleFileListViewController : UIViewController

- (instancetype)initWithBundleName:(NSString *)bundleName;

- (instancetype)initWithBundlePath:(NSString *)bundlePath;

@end

NS_ASSUME_NONNULL_END
