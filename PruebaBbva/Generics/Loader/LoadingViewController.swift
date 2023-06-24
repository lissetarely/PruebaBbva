//
//  LoadingViewController.swift
//  PruebaBbva
//
//  Created by Liset Areli Sanchez Martinez on 23/06/23.
//

import UIKit
import SwiftyGif

class LoadingViewController: UIViewController {
    
    let labelText : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 32)
        label.text = "Cargando..."
        label.textAlignment = .center
        return label
    }()
    
    let load: UIImageView = {
        do {
            let gif = try UIImage(gifName: "Manos.gif")
            let view = UIImageView(gifImage: gif, loopCount: 3) // Will loop 3 times
            view.contentMode = .scaleAspectFit
            view.image = UIImage(named: "")
            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalToConstant: 126).isActive = true
            view.heightAnchor.constraint(equalToConstant: 126).isActive = true
            view.alpha = 0
            return view
        } catch {
            print(error)
            return UIImageView()
        }
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        prepareUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareUI(){
        enterLoading()
    }
    
    private func enterLoading(){
        UIView.animate(withDuration: 1.2, delay: 0.4) {
            self.view.backgroundColor = .black.withAlphaComponent(0.86)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(load)
        self.view.addSubview(labelText)
        labelText.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 62).isActive = true
        labelText.anchor(left: self.view.leftAnchor, right: self.view.rightAnchor)
        self.load.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        self.load.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        let transform = load.transform.scaledBy(x: 3.1, y: 3.1)
        let labelTransform = load.transform.scaledBy(x: 3.6, y: 3.6).translatedBy(x: 0, y: -200)
        self.labelText.transform = labelTransform
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            UIView.animate(withDuration: 1, delay: 0.0, options: [.curveEaseInOut]) {
                self.load.alpha = 1
            } completion: { _ in
                
            }
            UIView.animate(withDuration: 1, delay: 0.0, options: [ .curveEaseInOut]) {
                self.load.transform = transform
                self.labelText.transform = .identity
                self.view.layoutIfNeeded()
            } completion: { _ in
                
            }
        })

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}

extension UIViewController {
    func showLoader(_ completion: @escaping (() -> ())) {
        let controller = LoadingViewController()
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .overCurrentContext
        self.present(controller, animated: true, completion: completion)
    }
    
    func dismissLoader(_ completion: @escaping (() -> ())) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.9, execute: {
            self.dismiss(animated: true, completion: completion)
        })
    }
}

