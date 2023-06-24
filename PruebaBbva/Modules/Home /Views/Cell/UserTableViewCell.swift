//
//  UserTableViewCell.swift
//  PruebaBbva
//
//  Created by Liset Areli Sanchez Martinez on 23/06/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    internal lazy var imageProfile: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ic_login")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.setDimensions(height: 90, width: 90)
        view.layer.cornerRadius = 45
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    internal lazy var lblPersonalInfo: UILabel = {
       let lblInfo = UILabel()
        lblInfo.numberOfLines = 0
        lblInfo.lineBreakMode = .byWordWrapping
        lblInfo.font = UIFont.systemFont(ofSize: 13)
        lblInfo.translatesAutoresizingMaskIntoConstraints = false
        return lblInfo
    }()
    
    internal lazy var lblAdressInfo: UILabel = {
       let lblAdd = UILabel()
        lblAdd.font = UIFont.systemFont(ofSize: 13)
        lblAdd.numberOfLines = 0
        lblAdd.lineBreakMode = .byWordWrapping
        lblAdd.translatesAutoresizingMaskIntoConstraints = false
        return lblAdd
    }()
    
    internal lazy var lblPhone: UILabel = {
       let lblPhone = UILabel()
        lblPhone.font = UIFont.systemFont(ofSize: 13)
        lblPhone.numberOfLines = 0
        lblPhone.lineBreakMode = .byWordWrapping
        lblPhone.translatesAutoresizingMaskIntoConstraints = false
        return lblPhone
    }()
    
    internal lazy var lblAge: UILabel = {
       let lblAge = UILabel()
        lblAge.font = UIFont.systemFont(ofSize: 13)
        lblAge.numberOfLines = 0
        lblAge.lineBreakMode = .byWordWrapping
        lblAge.translatesAutoresizingMaskIntoConstraints = false
        return lblAge
    }()
    
    internal lazy var lblNat: UILabel = {
       let lblNat = UILabel()
        lblNat.font = UIFont.systemFont(ofSize: 13)
        lblNat.numberOfLines = 0
        lblNat.lineBreakMode = .byWordWrapping
        lblNat.translatesAutoresizingMaskIntoConstraints = false
        return lblNat
    }()
    
    internal lazy var stackInfo: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(self.lblPhone)
        stack.addArrangedSubview(self.lblAge)
        stack.addArrangedSubview(self.lblNat)
        return stack
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.prepareUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareUI() {
        self.contentView.addSubview(lblPersonalInfo)
        self.contentView.addSubview(lblAdressInfo)
        self.contentView.addSubview(stackInfo)
        let viewMargin = UIView()
        self.contentView.addSubview(viewMargin)
        viewMargin.backgroundColor = .lightGray
        viewMargin.anchor(left: self.contentView.leftAnchor,paddingLeft: 20,width: 100, height: 100)
        viewMargin.layer.cornerRadius = 50
        viewMargin.addSubview(imageProfile)
        viewMargin.centerY(inView: lblPersonalInfo)
        imageProfile.centerX(inView: viewMargin)
        imageProfile.centerY(inView: viewMargin)
        lblPersonalInfo.anchor(top: self.contentView.topAnchor, left: viewMargin.rightAnchor,right: self.contentView.rightAnchor, paddingTop: 20, paddingLeft: 20)
        lblAdressInfo.anchor(top: lblPersonalInfo.bottomAnchor, left: self.contentView.leftAnchor, right: self.contentView.rightAnchor, paddingTop: 16, paddingLeft: 20, paddingRight: 20)
        self.stackInfo.anchor(top: self.lblAdressInfo.bottomAnchor, left: self.contentView.leftAnchor, bottom: self.contentView.bottomAnchor, right: self.contentView.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 10, paddingRight: 20)
    }
    
    func setUp(user: User) {
        attributedInfo(user: user)
        self.imageProfile.downloadImage(imageURL: user.picture.medium)
    }
    
    func attributedInfo(user: User) {
        let attributed = NSMutableAttributedString()
        let titleName = NSAttributedString(string: "Nombre:\n", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.lightGray
        ])
        let nameAttributed = NSAttributedString(string: "\(user.name.title) \(user.name.first) \(user.name.last)\n", attributes: [
            .font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.black
        ])
        let emailAttributed = NSAttributedString(string: "\(user.email)\n", attributes: [
            .font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.purple
        ])
        let userNameAttributed = NSAttributedString(string: "\(user.login.username)\n", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.black
        ])
        attributed.append(titleName)
        attributed.append(nameAttributed)
        attributed.append(emailAttributed)
        attributed.append(userNameAttributed)
        self.lblPersonalInfo.attributedText = attributed
        
        let addressAttributed = NSMutableAttributedString()
        let titleAddress = NSAttributedString(string: "Dirección:\n", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.lightGray
        ])
        let addressInfoAttributed = NSAttributedString(string: "\(user.location.state), \(user.location.city)", attributes: [
            .font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.black
        ])
        addressAttributed.append(titleAddress)
        addressAttributed.append(addressInfoAttributed)
        self.lblAdressInfo.attributedText = addressAttributed
        
        let phoneAttributed = NSMutableAttributedString()
        let titlePhone = NSAttributedString(string: "Telefono:\n", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.lightGray
        ])
        let phoneInfoAttributed = NSAttributedString(string: "\(user.phone)", attributes: [
            .font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.black
        ])
        phoneAttributed.append(titlePhone)
        phoneAttributed.append(phoneInfoAttributed)
        self.lblPhone.attributedText = phoneAttributed
        
        let ageAttributed = NSMutableAttributedString()
        let titleAge = NSAttributedString(string: "Edad:\n", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.lightGray
        ])
        let ageInfoAttributed = NSAttributedString(string: "\(user.dob.age)", attributes: [
            .font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.black
        ])
        ageAttributed.append(titleAge)
        ageAttributed.append(ageInfoAttributed)
        self.lblAge.attributedText = ageAttributed
        
        let natAttributed = NSMutableAttributedString()
        let titleNat = NSAttributedString(string: "Nacionalidad:\n", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.lightGray
        ])
        let natInfoAttributed = NSAttributedString(string: "\(user.nat)", attributes: [
            .font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.black
        ])
        natAttributed.append(titleNat)
        natAttributed.append(natInfoAttributed)
        self.lblNat.attributedText = natAttributed
    }
}
