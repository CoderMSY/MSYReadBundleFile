//
//  MSYViewController.m
//  MSYReadBundleFile
//
//  Created by XXX on 12/10/2021.
//  Copyright (c) 2021 XXX. All rights reserved.
//

#import "MSYViewController.h"
#import <Masonry/Masonry.h>
#import <MSYTableView/MSYCommonTableView.h>
#import <MSYTableView/MSYCommonTableData.h>
#import <MSYTableView/MSYTableViewProtocol.h>

#import <MSYReadBundleFile/MSYBundleFileListViewController.h>

@interface MSYViewController () <MSYTableViewProtocol>

@property (nonatomic, strong) MSYCommonTableView *listView;

@end

@implementation MSYViewController

#pragma mark - lifecycle methods

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.listView];
    [self initConstraints];
    
    [self loadDataSource];
}

#pragma mark - public methods

#pragma mark - private methods

- (void)initConstraints {
    [self.listView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (void)loadDataSource {
    NSArray *dicList = @[
        @{
            kRow_title : @"TableView.bundle",
            kRow_detailTitle : @"bundle name",
        },
        @{
            kRow_title : @"TableView.bundle",
            kRow_detailTitle : @"bundle path",
        },
        @{
            kRow_title : @"Test.bundle",
            kRow_detailTitle : @"bundle path",
        }
    ];
    NSMutableArray *rowDicList = [NSMutableArray array];
    for (NSDictionary *dic in dicList) {
        
        NSDictionary *rowDic = @{
            kRow_title : dic[kRow_title] ? : @"",
            kRow_detailTitle : dic[kRow_detailTitle] ? : @""
        };
        [rowDicList addObject:rowDic];
    }
    NSDictionary *sectionDic = @{
        kSec_rowContent : rowDicList,
        kSec_headerTitle : @"Example demo"
    };
    self.listView.dataSource = [MSYCommonTableSection sectionsWithData:@[sectionDic]];
}

#pragma mark - MSYTableViewProtocol

- (void)msy_tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MSYCommonTableSection *sectionModel = self.listView.dataSource[indexPath.section];
    MSYCommonTableRow *rowModel = sectionModel.rows[indexPath.row];
    
    if ([rowModel.detailTitle isEqualToString:@"bundle name"]) {
        MSYBundleFileListViewController *ctr = [[MSYBundleFileListViewController alloc] initWithBundleName:rowModel.title];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else {
        NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:rowModel.title];
        MSYBundleFileListViewController *ctr = [[MSYBundleFileListViewController alloc] initWithBundlePath:bundlePath];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    
}

#pragma mark - getter && setter

- (MSYCommonTableView *)listView {
    if (!_listView) {
        _listView = [[MSYCommonTableView alloc] initWithCellStyle:UITableViewCellStyleSubtitle];
    }
    return _listView;
}

@end
