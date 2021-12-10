//
//  MSYBundleFolderModel.h
//  MSYReadBundleFile
//
//  Created by Simon Miao on 2021/12/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MSYBundleFolderModel : NSObject

@property (nonatomic, copy) NSString *folderName;
@property (nonatomic, copy) NSString *folderPath;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

NS_ASSUME_NONNULL_END
