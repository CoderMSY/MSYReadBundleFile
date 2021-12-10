//
//  MSYReadBundleFile.m
//  MSYReadBundleFile_Example
//
//  Created by Simon Miao on 2021/12/10.
//  Copyright © 2021 XXX. All rights reserved.
//

#import "MSYReadBundleFile.h"
#import "MSYBundleFolderModel.h"
#import "MSYBundleFileModel.h"

@implementation MSYReadBundleFile

+ (MSYBundleFolderModel *)getBundleFileWithBundlePath:(NSString *)bundlePath {
    if (!bundlePath) {
        return nil;
    }
    
    MSYBundleFolderModel *folderModel = [[MSYBundleFolderModel alloc] init];
    folderModel.folderName = bundlePath.lastPathComponent;
    folderModel.folderPath = bundlePath;
    
    [self recursiveGetFileWithPath:bundlePath folderModel:folderModel];
    
    return folderModel;
}

#pragma mark - lifecycle methods

#pragma mark - public methods

#pragma mark - private methods

+ (void)recursiveGetFileWithPath:(NSString *)path
                     folderModel:(MSYBundleFolderModel *)folderModel {
    
    NSArray *directiryList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    //文件排序
    NSStringCompareOptions comparisonOptions = NSCaseInsensitiveSearch | NSNumericSearch | NSWidthInsensitiveSearch | NSForcedOrderingSearch;
    directiryList = [directiryList sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        NSRange range = NSMakeRange(0, obj1.length);
        
        return [obj1 compare:obj2 options:comparisonOptions range:range];
    }];
    
    for (NSString *dir in directiryList) {
        NSString *subPath = [path stringByAppendingPathComponent:dir];
        
        BOOL isDir = NO;
        BOOL isFile = [[NSFileManager defaultManager] fileExistsAtPath:subPath isDirectory:&isDir];
        
        if (isDir) {
            MSYBundleFolderModel *subFolderModel = [[MSYBundleFolderModel alloc] init];
            subFolderModel.folderName = dir;
            subFolderModel.folderPath = subPath;
            
            [self recursiveGetFileWithPath:subPath folderModel:subFolderModel];
            
            [folderModel.folderModelList addObject:subFolderModel];
        }
        else {
            if (isFile) {
                MSYBundleFileModel *fileModel = [[MSYBundleFileModel alloc] init];
                fileModel.fileName = dir;
                fileModel.filePath = subPath;
                
                [folderModel.fileModelList addObject:fileModel];
            }
        }
    }
}

@end
