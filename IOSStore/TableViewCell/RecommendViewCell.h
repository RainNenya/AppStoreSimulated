//
//  RecommendViewCell.h
//  IOSStore
//
//  Created by Percy on 2023/4/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RecommendViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *cellImage;
@property (nonatomic, strong) UILabel *cellTitle;
@property (nonatomic, strong) UILabel *cellText;
@property (nonatomic, strong) UIButton *cellButton;
@property (nonatomic, strong) UILabel *cellButtonTitle;

@end

NS_ASSUME_NONNULL_END
