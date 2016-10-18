//
//  DuppleCollectionView.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/9/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "DuppleCollectionView.h"

@implementation DuppleCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView: (UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.numOfCharacters.count;
}

-(UICollectionViewCell *)collectionView: (UICollectionView*) collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UICollectionViewCell *cellOne = [collectionView dequeueReusableCellWithReuseIdentifier: @"collectionCellOne" forIndexPath: indexPath];
    
    UIImageView *characterImageView = [[UIImageView alloc] init];
    
    if (self.numOfCharacters[indexPath.row])
    {
        characterImageView.image = self.numOfCharacters[indexPath.row];
    }
    
    [cellOne.contentView addSubview: characterImageView];
    
    return cellOne;

}

//-(void)populateCollectionView
//{
//    [StartScreenViewController registerClass: [UICollectionViewCell class] forCellWithReuseIdentifier: @"collectionCellOne"];
//
//}

@end
