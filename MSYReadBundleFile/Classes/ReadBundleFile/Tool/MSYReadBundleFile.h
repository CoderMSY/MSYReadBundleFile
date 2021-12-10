//
//  MSYReadBundleFile.h
//  MSYReadBundleFile_Example
//
//  Created by Simon Miao on 2021/12/10.
//  Copyright © 2021 XXX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class MSYBundleFolderModel;
@interface MSYReadBundleFile : NSObject

+ (MSYBundleFolderModel *)getBundleFileWithBundlePath:(NSString *)bundlePath;

@end

NS_ASSUME_NONNULL_END
