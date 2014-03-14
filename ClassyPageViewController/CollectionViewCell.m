//
// Created by Morten Holm on 14/03/14.
// Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "CollectionViewCell.h"

@interface CollectionViewCell()
@property (nonatomic) UILabel *label;
@end

@implementation CollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _label = [[UILabel alloc] initWithFrame:self.contentView.frame];
        _label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_label];
    }

    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.label.text = @"";
    self.label.frame = self.contentView.frame;
}

- (void)setText:(NSString *)text {
    self.label.text = text;
}


@end