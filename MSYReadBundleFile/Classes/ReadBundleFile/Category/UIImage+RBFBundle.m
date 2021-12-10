//
//  UIImage+RBFBundle.m
//  MSYReadBundleFile
//
//  Created by Simon Miao on 2021/12/10.
//

#import "UIImage+RBFBundle.h"

@implementation UIImage (RBFBundle)

+ (UIImage *)rbf_getAssetsImageWithName:(NSString *)imageName
                            bundleClass:(Class)bundleClass
                           resourceName:(NSString *)resourceName {
    NSBundle *mainBundle = [NSBundle bundleForClass:bundleClass];
    NSString *resourcePath = [mainBundle pathForResource:resourceName ofType:@"bundle"];
    NSBundle *resourceBundle = [NSBundle bundleWithPath:resourcePath] ? : mainBundle;
    
    UIImage *image = [UIImage imageNamed:imageName inBundle:resourceBundle compatibleWithTraitCollection:nil];
    
    return image;
}

@end
