//
//  ThemeStyle.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/21.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit

enum NavigationbarStyle {
    case `default`
    
    case white
}

@objc protocol Theme {
    
    var statusBarStyle: UIStatusBarStyle {get}
    
    var navgationbarBgImage: UIImage {get}
    
    var navgationbarTitleStyle: [String : Any] {get}
    
    var tinColor: UIColor {get}
    
    var backImage:UIImage {get}

    var backgroundColor:UIColor {get}
    
    @objc optional var tabbarTitleStyle: [String : Any] {get}
    
    @objc optional var tabbarSelectedTitleStyle: [String : Any] {get}
    
}


class ThemeStyle {
    
    static let sharedInstance = ThemeStyle()
    
   public func customAppearance() {
        
        let theme = DefaultTheme()
        self.setThemeStyle(theme)
    }
    
    public func setStyle(style: NavigationbarStyle) {
        var theme:Theme?
        switch style {
      
        case .white:
            theme = WhiteTheme()
            break
        default:
            theme = DefaultTheme()
            break
        }
        
        self.setThemeStyle(theme!)
        
    }
    
    private func setThemeStyle(_ theme:Theme) {
     
        UIApplication.shared.statusBarStyle = theme.statusBarStyle

        let navigationbar:UINavigationBar = UINavigationBar.appearance()
        
        navigationbar.titleTextAttributes = theme.navgationbarTitleStyle
        
        navigationbar.shadowImage = UIImage()
        navigationbar.backgroundColor = theme.backgroundColor
        let image =  theme.backImage.withRenderingMode(.alwaysOriginal)
        
        navigationbar.backIndicatorImage = image;
        navigationbar.backIndicatorTransitionMaskImage = image;
        
        let tabbarItem:UITabBarItem = UITabBarItem.appearance()
        
        tabbarItem.titlePositionAdjustment = UIOffsetMake(0, -2)
        tabbarItem .setTitleTextAttributes(theme.tabbarTitleStyle, for: .normal)
        tabbarItem .setTitleTextAttributes(theme.tabbarSelectedTitleStyle, for: .selected)
        
        let tabbar: UITabBar = UITabBar.appearance()
        tabbar.backgroundImage = UIColor.white.image
    }
}


class DefaultTheme: Theme {

    internal var tinColor: UIColor {
        return AppConstantColor.main
    }

    internal var navgationbarTitleStyle: [String : Any] {
       
        let shadow = NSShadow()
        
        let color = UIColor.white
        
        let font = AppConstantFont._18px
        
        return [NSFontAttributeName:font,
                NSForegroundColorAttributeName:color,
                NSShadowAttributeName : shadow
                ]
    }

    internal var navgationbarBgImage: UIImage {
        
        return UIColor.clear.image
    }
    
    internal var backImage:UIImage {
        
        return #imageLiteral(resourceName: "new_nav_back_white")
    }
    
    var backgroundColor:UIColor {
        return AppConstantColor.main
    }

    internal var statusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }

    internal var tabbarTitleStyle: [String : Any] {
        
        let shadow = NSShadow()
        
        let color = AppConstantColor.secondary
        
        let font = AppConstantFont._10px
        
        return [NSFontAttributeName:font,
                NSForegroundColorAttributeName:color,
                NSShadowAttributeName : shadow
        ]
    }

    internal var tabbarSelectedTitleStyle: [String : Any] {
        
        let shadow = NSShadow()
        
        let color = AppConstantColor.main
        
        let font = AppConstantFont._10px
        
        return [NSFontAttributeName:font,
                NSForegroundColorAttributeName:color,
                NSShadowAttributeName : shadow
        ]
    }
}

class WhiteTheme: Theme {
    internal var tinColor: UIColor {
        return .white
    }
    
    internal var navgationbarTitleStyle: [String : Any] {
        
        let shadow = NSShadow()
        
        let color = AppConstantColor.important
        
        let font = AppConstantFont._18px
        
        return [NSFontAttributeName:font,
                NSForegroundColorAttributeName:color,
                NSShadowAttributeName : shadow
        ]
    }
    
    internal var navgationbarBgImage: UIImage {
        
        return UIColor.clear.image
    }
    
    internal var backImage:UIImage {
        
        return #imageLiteral(resourceName: "new_nav_back_white")
    }
    
    var backgroundColor:UIColor {
        return .white
    }

    
    internal var statusBarStyle: UIStatusBarStyle {
        
        return .default
    }
    
    internal var tabbarTitleStyle: [String : Any] {
        
        let shadow = NSShadow()
        
        let color = AppConstantColor.secondary
        
        let font = AppConstantFont._10px
        
        return [NSFontAttributeName:font,
                NSForegroundColorAttributeName:color,
                NSShadowAttributeName : shadow
        ]
    }
    
    internal var tabbarSelectedTitleStyle: [String : Any] {
        
        let shadow = NSShadow()
        
        let color = AppConstantColor.main
        
        let font = AppConstantFont._10px
        
        return [NSFontAttributeName:font,
                NSForegroundColorAttributeName:color,
                NSShadowAttributeName : shadow
        ]
    }
}



