//
//  MSYBundleFileModel.h
//  MSYReadBundleFile
//
//  Created by Simon Miao on 2021/12/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MSYBundleFileModel : NSObject

@property (nonatomic, copy) NSString *fileName;
@property (nonatomic, copy) NSString *filePath;

@end

NS_ASSUME_NONNULL_END
