//
//  SegmentControlExtension.swift
//  hygym
//
//  Created by HK on 01/11/22.
//

import Foundation
import UIKit

enum PreferenceIndex : Int {
    case Preference0 = 0
    case Preference1 = 1
    case Preference2 = 2
    case Preference3 = 3
    case Preference4 = 4
    case Preference5 = 5
    case Preference6 = 6
}

extension UISegmentedControl {
    func setSelectedSegmentForegroundColor(_ foregroundColor: UIColor, andTintColor tintColor: UIColor) {
        if #available(iOS 13.0, *) {
            self.setTitleTextAttributes([.foregroundColor: foregroundColor], for: .selected)
            self.selectedSegmentTintColor = tintColor;
        } else {
            self.tintColor = tintColor;
        }
    }

    func defaultConfiguration(font: UIFont = UIFont.systemFont(ofSize: 12), color: UIColor = UIColor.darkGray) {
        let defaultAttributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color
        ]
        setTitleTextAttributes(defaultAttributes, for: .normal)
    }

    func selectedConfiguration(font: UIFont = UIFont.boldSystemFont(ofSize: 12), color: UIColor = UIColor.red) {
        let selectedAttributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color
        ]
        setTitleTextAttributes(selectedAttributes, for: .selected)
    }
}

func fixBackgroundSegmentControl( _ segmentControl: UISegmentedControl){
    if #available(iOS 13.0, *) {
        //just to be sure it is full loaded
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            for i in 0...(segmentControl.numberOfSegments-1)  {
                let backgroundSegmentView = segmentControl.subviews[i]
                //it is not enogh changing the background color. It has some kind of shadow layer
                backgroundSegmentView.isHidden = true
            }
        }
    }
}
