//
//  UIImage+RBFBundle.h
//  MSYReadBundleFile
//
//  Created by Simon Miao on 2021/12/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (RBFBundle)

+ (UIImage *)rbf_getAssetsImageWithName:(NSString *)imageName
                            bundleClass:(Class)bundleClass
                           resourceName:(NSString *)resourceName;

@end

NS_ASSUME_NONNULL_END
