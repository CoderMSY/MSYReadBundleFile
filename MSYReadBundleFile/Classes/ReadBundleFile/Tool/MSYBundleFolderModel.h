//
//  MSYBundleFolderModel.h
//  MSYReadBundleFile
//
//  Created by Simon Miao on 2021/12/10.
//

#import <Foundation/Foundation.h>
#import "MSYBundleFileModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MSYBundleFolderModel : NSObject

@property (nonatomic, copy) NSString *folderName;
@property (nonatomic, copy) NSString *folderPath;

@property (nonatomic, strong) NSMutableArray <MSYBundleFolderModel *>*folderModelList;
@property (nonatomic, strong) NSMutableArray <MSYBundleFileModel *>*fileModelList;

@end

NS_ASSUME_NONNULL_END
