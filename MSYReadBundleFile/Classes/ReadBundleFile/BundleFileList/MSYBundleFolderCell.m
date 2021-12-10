//
//  MSYBundleFolderCell.m
//  MSYReadBundleFile
//
//  Created by Simon Miao on 2021/12/10.
//

#import "MSYBundleFolderCell.h"
#import <Masonry/Masonry.h>
#import <MSYTableView/MSYCommonTableData.h>

#import "UIImage+RBFBundle.h"
#import "MSYBundleFolderModel.h"

@interface MSYBundleFolderCell ()

@property (nonatomic, strong) UIImageView *iconIV;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *detailLab;

@end

@implementation MSYBundleFolderCell

#pragma mark - lifecycle methods

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.detailLab];
        
        [self initConstraints];
    }
    return self;
}

#pragma mark - public methods

#pragma mark - private methods

- (void)initConstraints {
    [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.leading.mas_equalTo(self.contentView).offset(15);
        make.size.mas_equalTo(30);
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.iconIV.mas_trailing).offset(15);
        make.bottom.mas_equalTo(self.contentView.mas_centerY).offset(-2);
        make.trailing.mas_lessThanOrEqualTo(self.contentView).offset(-15);
    }];
    [self.detailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_centerY).offset(2);
        make.leading.mas_equalTo(self.titleLab);
        make.trailing.mas_lessThanOrEqualTo(self.contentView).offset(-15);
    }];
}

#pragma mark - MSYTableViewCellProtocol

- (void)refreshData:(MSYCommonTableRow *)rowData tableView:(UITableView *)tableView {
    self.titleLab.text = rowData.title;
    self.detailLab.text = rowData.detailTitle;
    if ([rowData.extraInfo isKindOfClass:[MSYBundleFolderModel class]]) {
        UIImage *image = [UIImage rbf_getAssetsImageWithName:@"rbf_icon_folder"  bundleClass:[self class] resourceName:@"MSYReadBundleFile"];
        self.iconIV.image = image;
    }
    else {
        UIImage *image = [UIImage rbf_getAssetsImageWithName:@"rbf_icon_file"  bundleClass:[self class] resourceName:@"MSYReadBundleFile"];
        self.iconIV.image = image;
    }
}

#pragma mark - getter && setter

- (UIImageView *)iconIV {
    if (!_iconIV) {
        _iconIV = [[UIImageView alloc] init];
    }
    return _iconIV;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.textColor = [UIColor blackColor];
    }
    return _titleLab;
}

- (UILabel *)detailLab {
    if (!_detailLab) {
        _detailLab = [[UILabel alloc] init];
        _detailLab.textColor = [UIColor lightGrayColor];
        _detailLab.font = [UIFont systemFontOfSize:12.0];
    }
    return _detailLab;
}

@end
