//
//  MainTabBarController.swift
//  teamY
//
//  Created by 김도연 on 1/11/25.
//
import UIKit

public class MainTabBarController: UITabBarController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        configureTabs()
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let tabFrame = tabBar.frame
        tabBar.frame = tabFrame
    }
    
    public func configureTabs() {
        let nav1 = UINavigationController(rootViewController: ViewController())
        let nav2 = UINavigationController(rootViewController: ViewController())
        
        let home = UIImage(named: "TabHome")?.resize(to: CGSize(width: 25, height: 25))
        let note = UIImage(named: "TabNote")?.resize(to: CGSize(width: 25, height: 25))

        nav1.tabBarItem = UITabBarItem(title: "", image: home, tag: 0)
        nav2.tabBarItem = UITabBarItem(title: "", image: note, tag: 1)
        
        UITabBar.clearShadow()
        tabBar.layer.applyShadow(color: .gray, alpha: 0.3, x: 0, y: 0, blur: 15)
        
        tabBar.tintColor = .label
        tabBar.backgroundColor = .white
        
        tabBar.tintColor = .brown
        tabBar.unselectedItemTintColor = .gray
        
        setViewControllers([nav1, nav2], animated: true)
    }
}

// MARK: - UITabBarControllerDelegate
extension MainTabBarController: UITabBarControllerDelegate {
    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // 현재 선택된 탭이 다시 선택되었을 때만 처리
        guard let navController = viewController as? UINavigationController else { return }
        
        // 루트 뷰로 이동
        navController.popToRootViewController(animated: true)
    }
}
