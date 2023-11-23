//
//  CollectionViewLayouts.swift
//  Picsart Academy iOS Task (Suren Poghosyan)
//
//  getd by Suren Poghosyan on 23.11.23.
//

import UIKit


// High level "Hardcoded" Class for generating different layouts 
final class CollectionViewLayouts {
    
    func getSingleItemLayout() -> UICollectionViewLayout {
        let fullScreenItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(1.0)))
        fullScreenItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                                          heightDimension: .fractionalHeight(0.9)),
                                                       subitems: [fullScreenItem])

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    func getTwoHalfScreenItemsLayout() -> UICollectionViewLayout {
        let leadingItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.5)))
        leadingItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        let trailingItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.5)))
        trailingItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.9)),
            subitems: [leadingItem, trailingItem])

        let section = NSCollectionLayoutSection(group: verticalGroup)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

    


    
    
    func getHalfScreenAndQuartersLayout() -> UICollectionViewLayout {
        let halfScreenItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.5)))
        halfScreenItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        let quarterItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                               heightDimension: .fractionalHeight(1.0)))
        quarterItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        let quartersGroup1 = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(0.5)),
            repeatingSubitem: quarterItem,
            count: 2)

        let quartersGroup2 = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(0.5)),
            repeatingSubitem: quarterItem,
            count: 2)

        
        let quartersGroup3 = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(0.5)),
            subitems: [quartersGroup1, quartersGroup2]
            )

        

        let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.9)),
            subitems: [halfScreenItem, quartersGroup3])

        let section = NSCollectionLayoutSection(group: verticalGroup)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

    
    func getQuartersAndEighthsLayout() -> UICollectionViewLayout {
        let quarterItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                               heightDimension: .fractionalHeight(1.0)))
        quarterItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        let eighthItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25),
                                               heightDimension: .fractionalHeight(0.5)))
        eighthItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        
        let quartersGroup1 = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(0.5)),
            repeatingSubitem: quarterItem,
            count: 2)

        let quartersGroup2 = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(0.5)),
            repeatingSubitem: quarterItem,
            count: 2)

        let quartersGroup3 = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(0.5)),
            repeatingSubitem: quarterItem,
            count: 2)


        let eighthsHalfGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(0.5)),
            repeatingSubitem: eighthItem,
            count: 2)
        

        

        
        let quartersGroup4 = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(0.5)),
            subitems: [quartersGroup1, quartersGroup2]
            )

        let quartersGroup5 = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(0.5)),
            subitems: [quartersGroup3, eighthsHalfGroup]
            )
        
        let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.9)),
            subitems: [quartersGroup4, quartersGroup5])

        let section = NSCollectionLayoutSection(group: verticalGroup)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    
    
    func getHalfAndQuartersAndEighthLayout() -> UICollectionViewLayout {

        let leadingItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.5)))
        leadingItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        let quarterItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                               heightDimension: .fractionalHeight(1.0)))
        quarterItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        let eighthItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                               heightDimension: .fractionalHeight(1.0)))
        eighthItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        
        let quartersGroup2 = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(0.5)),
            repeatingSubitem: quarterItem,
            count: 2)


        let eighthsHalfGroup1 = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(0.5)),
            repeatingSubitem: eighthItem,
            count: 2)

        let eighthsHalfGroup2 = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(0.5)),
            repeatingSubitem: eighthItem,
            count: 2)

        let eighthsHalfGroup3 = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(0.5)),
            repeatingSubitem: eighthItem,
            count: 2)

        let eighthsHalfGroup4 = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(0.5)),
            repeatingSubitem: eighthItem,
            count: 2)

        let eighthsHalfGroupVertical = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .fractionalHeight(1.0)),
            subitems: [eighthsHalfGroup1, eighthsHalfGroup2]
            )

        let eighthsHalfGroupVertical2 = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .fractionalHeight(1.0)),
            subitems: [eighthsHalfGroup3, eighthsHalfGroup4]
            )

        let eighthsHalfGroupHorizontal = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(0.5)),
            subitems: [eighthsHalfGroupVertical, eighthsHalfGroupVertical2]
            )

        

        
        let quartersGroup4 = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(0.5)),
            subitems: [quartersGroup2, eighthsHalfGroupHorizontal]
            )

        
        let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.9)),
            subitems: [leadingItem, quartersGroup4])

        let section = NSCollectionLayoutSection(group: verticalGroup)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

}
