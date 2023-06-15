//
//  RecommendViewCell.m
//  IOSStore
//
//  Created by Percy on 2023/4/24.
//

#import "RecommendViewCell.h"

@implementation RecommendViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        // 通过文件名获取完整路径
        //NSString* fileName = [[NSBundle mainBundle] pathForResource:@"RecommendPList" ofType:@"plist"];
        // 获取数据
        //NSArray* array = [[NSArray alloc]initWithContentsOfFile:fileName];
           
        self.cellImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
        self.cellImage.backgroundColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1];
        _cellImage.layer.cornerRadius = 25;
        _cellImage.layer.masksToBounds = YES;
        [self addSubview:self.cellImage];
        
        self.cellTitle = [[UILabel alloc]initWithFrame:CGRectMake(70, 5, 200, 30)];
        self.cellTitle.text = @"王者荣耀";
        self.cellTitle.font = [UIFont systemFontOfSize:18];
        self.cellTitle.textColor = [UIColor blackColor];
        [self addSubview:self.cellTitle];
        
        self.cellText = [[UILabel alloc]initWithFrame:CGRectMake(70, 30, 250, 30)];
        self.cellText.text = @"S31赛季 东方来客";
        self.cellText.font = [UIFont systemFontOfSize:12];
        self.cellText.textColor = [UIColor grayColor];
        [self addSubview:self.cellText];
        
        self.cellButton = [[UIButton alloc]initWithFrame:CGRectMake(300, 15, 50, 30)];
        _cellButton.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
        [_cellButton setTitle:@"获取" forState:(UIControlStateNormal)];
        [_cellButton setTitleColor:[UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1] forState:(UIControlStateNormal)];
        _cellButton.layer.cornerRadius = 10;
        _cellButton.layer.masksToBounds = YES;
        [self addSubview:self.cellButton];
        
        self.cellButtonTitle = [[UILabel alloc]initWithFrame:CGRectMake(300, 40, 50, 20)];
        self.cellButtonTitle.text = @"App内获取";
        self.cellButtonTitle.font = [UIFont systemFontOfSize:10];
        [self addSubview:self.cellButtonTitle];
        
    }
    return self;
}

@end
