//
//  PageViewController.swift
//  ttFinance
//
//  Created by LiuRex on 2017/9/1.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit



class PageHeaderView: UIView {
    
    private var buttons:[UIButton] = []
    private var scrollView:UIScrollView!
    private var line:UIView!
    
    var font:UIFont = AppConstantFont._16px

    var titles:[String] = []{
        didSet{
            self.configSubviews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.orange
        scrollView = UIScrollView(frame: CGRect(origin: CGPoint.zero, size: frame.size))
        scrollView.backgroundColor = UIColor.white
        scrollView.showsHorizontalScrollIndicator = false
        self.addSubview(scrollView)
        
        line = UIView()
        line.backgroundColor = AppConstantColor.main
        self.addSubview(line)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configSubviews() {
        
        let rects = self.CGRectFrom(titles: self.titles)
        
        guard rects.count != 0 else {
            return
        }
        
        let contentWidth =  (rects.last?.size.width)! + AppConstantMargin.level1 * 2

        let ret = contentWidth > self.width
        
        scrollView.contentSize = CGSize(width: contentWidth, height: self.height)
        scrollView.backgroundColor = UIColor.green
        let btnWidth:CGFloat = AppInformation.width / CGFloat(rects.count)
        
        for i in 0 ..< rects.count {
   
            var frame = rects[i]
            frame.origin.x += AppConstantMargin.level1
            let btn = UIButton(title: titles[i], titleColor: AppConstantColor.secondary, titleFont: AppConstantFont._16px)
            if ret {
                btn.frame = frame
            } else {
              btn.frame = CGRect(x: CGFloat(i) * btnWidth, y: 0, width: btnWidth, height: self.height)
            }
            btn.backgroundColor = UIColor.red
            btn.tag = i
            
            btn.setTitleColor(AppConstantColor.main, for: .selected)
            btn.titleLabel?.font = self.font
            
            buttons.append(btn)
            scrollView.addSubview(btn)
            
            if i == 0 {
                btn.isSelected = true
            }
        }
   
    }
    

}


extension PageHeaderView {
    
    
    func CGRectFrom(titles:[String]) -> [CGRect] {
        var rects = [CGRect]()
        
        
        var X:CGFloat = 0
        let Y:CGFloat = 0
      //  var height:CGFloat = self.height
        let margin = AppConstantMargin.level2
        for i in 0 ..< titles.count {
            let title:NSString = titles[i] as NSString
            let size = title.size(attributes: [NSFontAttributeName : font])
            let frame = CGRect(origin: CGPoint(x:X,y:Y), size: size)
            rects.append(frame)
            X += (size.width + margin)
        }
        

        return rects
    }

}


let headerHeight = AppConstantHeight.inputTextField

class PageViewController: UIViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {


    private var pageViewController: UIPageViewController?
    private var headerView:PageHeaderView?
    
    var titles:[String] = []
    
    var viewControllers: [UIViewController] = []
    
    var currentIndex:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configSubviews()
    }

    func configSubviews(){
        
        self.configHeaderView()
        
        let options:[String : Any] = [UIPageViewControllerOptionSpineLocationKey : UIPageViewControllerSpineLocation.min]
        
        pageViewController = UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal, options: options)
        
        pageViewController!.dataSource = self
        pageViewController!.delegate = self
        
        self.addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController!.view)

        pageViewController!.view.snp.makeConstraints({ (make) in
            
           make.edges.equalTo(UIEdgeInsetsMake(headerHeight, 0, 0, 0))
            
        });
        self.addViewControllers()
    }
    
    
    
    func addViewControllers() {
        
        guard self.viewControllers.count != 0 else {
            return
        }
        
        pageViewController?.setViewControllers([viewControllers.first!], direction: .forward, animated: false, completion: nil)
        
    }
    
    func configHeaderView() {
        
        let headerView:PageHeaderView = PageHeaderView(frame: CGRect(x: 0, y:0 , width: self.view.width, height: headerHeight))
        headerView.titles = self.titles
        self.view.addSubview(headerView);
    }
    
    
    func indexOfViewController(viewController:UIViewController?) -> Int {
        
        guard viewController != nil else {
            return NSNotFound
        }
    
        return self.viewControllers.index(of: viewController!)!
    }
    
    
    
    
    func viewControllerAtIndex(index:Int) -> UIViewController? {
        
        return self.viewControllers[index]
    }
    
    // In terms of navigation direction. For example, for 'UIPageViewControllerNavigationOrientationHorizontal', view controllers coming 'before' would be to the left of the argument view controller, those coming 'after' would be to the right.
    // Return 'nil' to indicate that no more progress can be made in the given direction.
    // For gesture-initiated transitions, the page view controller obtains view controllers via these methods, so use of setViewControllers:direction:animated:completion: is not required.
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?{
        
        var index = self.indexOfViewController(viewController: viewController)
        
        
        if index == 0 ||  index == NSNotFound{
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index: index)
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{

        
        var index = self.indexOfViewController(viewController: viewController)
        
        
        if  index == NSNotFound{
            return nil
        }
        
        index += 1
        
        if index == self.viewControllers.count {
            return nil
        }
        
        return self.viewControllerAtIndex(index: index)
    
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        self.currentIndex = self.indexOfViewController(viewController: pendingViewControllers[0])
    }

    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        
        if completed {
            
        } else {
            self.currentIndex = self.indexOfViewController(viewController: previousViewControllers[0])

        }
    }
}
