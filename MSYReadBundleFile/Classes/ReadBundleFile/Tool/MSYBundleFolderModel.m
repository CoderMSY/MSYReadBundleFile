//
//  MSYBundleFolderModel.m
//  MSYReadBundleFile
//
//  Created by Simon Miao on 2021/12/10.
//

#import "MSYBundleFolderModel.h"

@implementation MSYBundleFolderModel

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataSource;
}

@end
