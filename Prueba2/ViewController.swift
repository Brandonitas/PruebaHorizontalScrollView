//
//  ViewController.swift
//  Prueba2
//
//  Created by Brandon Reyes on 27/07/18.
//  Copyright © 2018 Brandon Reyes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var slideScrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slideScrollView.delegate = self
        
        let slides:[Slide] = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubview(toFront: pageControl)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createSlides() -> [Slide]{
        let slide1: Slide = Bundle.main.loadNibNamed("SlideNew", owner: self, options: nil)?.first as! Slide
        slide1.label.text = "Slide1"
        
        
        
        let slide2: Slide = Bundle.main.loadNibNamed("SlideNew", owner: self, options: nil)?.first as! Slide
        slide2.label.text = "Slide2"
        
        return [slide1,slide2]
    }
    
    func setupSlideScrollView(slides:[Slide]){
        slideScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        slideScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        
        slideScrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            slideScrollView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }


}

