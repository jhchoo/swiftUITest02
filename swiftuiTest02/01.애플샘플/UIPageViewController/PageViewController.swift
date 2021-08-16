//
//  PageViewController.swift
//  swiftuiTest02
//
//  Created by jhchoo on 2021/08/16.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    // setViewControllers(_:direction:animated:)currentPage @Binding속성 을 선언하는 것 외에도 바인딩 값을 전달하는 에 대한 호출도 업데이트합니다 .
    @Binding var currentPage: Int

    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        
        // UIPageViewController 의 데이터 소스로 코디네이터를 추가합니다
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)

        //  [UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
   
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // 이 코디네이터를 사용하여 대리자, 데이터 소스 및 target-action을 통한 사용자 이벤트 응답과 같은 일반적인 Cocoa 패턴을 구현할 수 있습니다.
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()

        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }

        // viewControllerBefore
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }

        // viewControllerAfter
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }

        // 바인딩이 양방향으로 연결된 상태에서 텍스트 보기는 스와이프할 때마다 올바른 페이지 번호를 표시하도록 업데이트됩니다.
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }

    }

}
