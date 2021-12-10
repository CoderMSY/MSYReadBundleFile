//
//  MSYBundleFolderModel.m
//  MSYReadBundleFile
//
//  Created by Simon Miao on 2021/12/10.
//

#import "MSYBundleFolderModel.h"

@implementation MSYBundleFolderModel

- (NSMutableArray<MSYBundleFolderModel *> *)folderModelList {
    if (!_folderModelList) {
        _folderModelList = [NSMutableArray arrayWithCapacity:0];
    }
    return _folderModelList;
}

- (NSMutableArray<MSYBundleFileModel *> *)fileModelList {
    if (!_fileModelList) {
        _fileModelList = [NSMutableArray arrayWithCapacity:0];
    }
    return _fileModelList;
}

@end
