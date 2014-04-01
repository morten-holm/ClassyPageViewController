//
// Created by Morten Holm on 14/03/14.
// Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <Classy.h>
#import "CollectionViewCell.h"

@interface CollectionViewCell()
@property (nonatomic) UILabel *label;
@end

@implementation CollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIView *background = [[UIView alloc] initWithFrame:self.contentView.frame];
        background.cas_styleClass = @"cellBackground";
        [self.contentView addSubview:background];
        
        int number = 0;
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                CGRect frame = CGRectMake((j * 10), (i * 10), 10, 10);
                UIView *view = [[UIView alloc] initWithFrame:frame];
                NSString *styleClass = number++ % 2 == 0 ? @"even" : @"odd";
                view.cas_styleClass = styleClass;
                [background addSubview:view];
            }
        }
        
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