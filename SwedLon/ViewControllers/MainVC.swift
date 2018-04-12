//
//  MainVC.swift
//  SwedLon
//
//  Created by Uladzislau Daratsiuk on 11/04/2018.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import UIKit
import Charts

class MainVC: UIViewController {
    
    let companyCollectionCellId = "companyCollectionCellId"
    let currencyCollectionCellId = "currencyCollectionCellId"
    
    var companyList: [Company] = []
    
    var nettoIncomeEntry = PieChartDataEntry(value: 1)
    var taxEntry = PieChartDataEntry(value: 2)
    var amountOfTheSalary = [PieChartDataEntry]()
    
    lazy var navigationBar: UINavigationBar = {
       let navBar = UINavigationBar(frame: CGRect(x: 0, y: 35, width: view.frame.width, height: 40))
        navBar.backgroundColor = .white
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        let navItem = UINavigationItem()
        navItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "menu"), style: .done, target: self, action: #selector(handleMenu))
        navItem.leftBarButtonItem?.tintColor = UIColor.lightGray.withAlphaComponent(1)
        navBar.setItems([navItem], animated: true)
        return navBar
    }()
    
    @objc func handleMenu(){
        
    }
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.contentSize.height = 800
        view.isScrollEnabled = true
        return view
    }()
    
    lazy var inputSalaryView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 7
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var inputTextField: UITextField = {
        let inputField = UITextField()
        inputField.translatesAutoresizingMaskIntoConstraints = false
        inputField.placeholder = "Enter your salary"
        inputField.textAlignment = .center
        inputField.font = UIFont.systemFont(ofSize: 18)
        inputField.layer.borderWidth = 1
        inputField.backgroundColor = .white
        inputField.layer.shadowOpacity = 0.2
        inputField.layer.shadowRadius = 7
        inputField.layer.borderColor = UIColor.lightGray.cgColor.copy(alpha: 0.3)
        inputField.layer.cornerRadius = 5
        return inputField
    }()
    
    lazy var salaryDetailsView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 7
        view.layer.cornerRadius = 10

        return view
    }()
    
    
    lazy var salaryChart: PieChartView = {
       let chart = PieChartView()
        chart.translatesAutoresizingMaskIntoConstraints = false
        chart.chartDescription?.text = "Details of the Salary"
        chart.chartDescription?.font = UIFont.systemFont(ofSize: 12)
        chart.layer.shadowOpacity = 0.2
        chart.layer.shadowRadius = 7
        nettoIncomeEntry.label = "Netto"
        taxEntry.label = "Taxes"
        return chart
    }()
    
    lazy var companiesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 60), collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(CompanyCell.self, forCellWithReuseIdentifier: companyCollectionCellId)
        view.backgroundColor = .white
        return view
    }()
    
    
    
    lazy var currenciesDetailsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 7
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    
    
    lazy var currenciesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 60), collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(CurrencyCell.self, forCellWithReuseIdentifier: currencyCollectionCellId)
        view.backgroundColor = .white
        return view
    }()
    
    lazy var currencyLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "More in others currencies"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.lightGray
        return label
    }()

    fileprivate func addAllViews() {
        view.addSubview(navigationBar)
        view.addSubview(scrollView)
        scrollView.addSubview(inputSalaryView)
        inputSalaryView.addSubview(inputTextField)
        scrollView.addSubview(salaryDetailsView)
        salaryDetailsView.addSubview(salaryChart)
        salaryDetailsView.addSubview(companiesCollectionView)
        scrollView.addSubview(currenciesDetailsView)
        currenciesDetailsView.addSubview(currenciesCollectionView)
        currenciesDetailsView.addSubview(currencyLabel)
    }
    
    fileprivate func setupAllViews() {
        setupScrollView()
        setupInputView()
        setupSalaryDetailsView()
        setupCurrenciesView()
    }
    
    fileprivate func connectAllCollections() {
        companiesCollectionView.delegate = self
        companiesCollectionView.dataSource = self
        currenciesCollectionView.delegate = self
        currenciesCollectionView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAllViews()
        setupAllViews()
        connectAllCollections()

        amountOfTheSalary = [nettoIncomeEntry, taxEntry]
        updateChartData()
        self.companyList = createCompaniesArray()
        
    }
    
    func updateChartData(){
        
        let chartDataSet = PieChartDataSet(values: amountOfTheSalary, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        let colors = [UIColor(named: "green"), UIColor(named: "orange")]
        chartDataSet.colors = colors as! [NSUIColor]
        salaryChart.data = chartData
        
    }
    
    func setupScrollView(){
        scrollView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupInputView(){
        inputSalaryView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        inputSalaryView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        inputSalaryView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        inputSalaryView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        inputSalaryView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        inputTextField.centerYAnchor.constraint(equalTo: inputSalaryView.centerYAnchor).isActive = true
        inputTextField.centerXAnchor.constraint(equalTo: inputSalaryView.centerXAnchor).isActive = true
        inputTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        inputTextField.leftAnchor.constraint(equalTo: inputSalaryView.leftAnchor, constant: 20).isActive = true
        inputTextField.rightAnchor.constraint(equalTo: inputSalaryView.rightAnchor, constant: -20).isActive = true
        
    }

    func setupSalaryDetailsView(){
        salaryDetailsView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        salaryDetailsView.topAnchor.constraint(equalTo: inputSalaryView.bottomAnchor, constant: 15).isActive = true
        salaryDetailsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        salaryDetailsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        salaryDetailsView.heightAnchor.constraint(equalToConstant: 390).isActive = true
        
        salaryChart.centerXAnchor.constraint(lessThanOrEqualTo: salaryDetailsView.centerXAnchor).isActive = true
        salaryChart.topAnchor.constraint(equalTo: salaryDetailsView.topAnchor, constant: 2).isActive = true
        salaryChart.leftAnchor.constraint(equalTo: salaryDetailsView.leftAnchor, constant: 1).isActive = true
        salaryChart.rightAnchor.constraint(equalTo: salaryDetailsView.rightAnchor, constant: -1).isActive = true
        salaryChart.heightAnchor.constraint(equalToConstant: 310).isActive = true
        
        companiesCollectionView.topAnchor.constraint(equalTo: salaryChart.bottomAnchor, constant: 5).isActive = true
        companiesCollectionView.leftAnchor.constraint(equalTo: salaryDetailsView.leftAnchor, constant: 10).isActive = true
        companiesCollectionView.rightAnchor.constraint(equalTo: salaryDetailsView.rightAnchor, constant: -10).isActive = true
        companiesCollectionView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    
    func setupCurrenciesView(){
        
        currenciesDetailsView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        currenciesDetailsView.topAnchor.constraint(equalTo: salaryDetailsView.bottomAnchor, constant: 15).isActive = true
        currenciesDetailsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        currenciesDetailsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        currenciesDetailsView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        
        currenciesCollectionView.topAnchor.constraint(equalTo: currencyLabel.bottomAnchor, constant: 15).isActive = true
        currenciesCollectionView.centerXAnchor.constraint(equalTo: currenciesDetailsView.centerXAnchor).isActive = true
        currenciesCollectionView.leftAnchor.constraint(equalTo: currenciesDetailsView.leftAnchor, constant: 10).isActive = true
        currenciesCollectionView.rightAnchor.constraint(equalTo: currenciesDetailsView.rightAnchor, constant: -10).isActive = true
        currenciesCollectionView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        currencyLabel.topAnchor.constraint(equalTo: currenciesDetailsView.topAnchor, constant: 10).isActive = true
        currencyLabel.leftAnchor.constraint(equalTo: currenciesDetailsView.leftAnchor, constant: 15).isActive = true
        
    }
    
    //TEMPORARY SOLUTION WITH ARRAY
    func createCompaniesArray() -> [Company]{
        var array: [Company] = []
        
        let company1 = Company(name: "TradeDoubler", logoName: "td", link: "http://www.tradedoubler.com/en/careers-at-tradedoubler/current-vacancies/")
        let company2 = Company(name: "Ikea", logoName: "ikea", link: "http://www.ikea.com/ms/en_JP/the_ikea_story/jobs_at_ikea/index.html")
        let company3 = Company(name: "Nordea", logoName: "nordea", link: "https://www.nordea.com/en/career/")
        let company4 = Company(name: "Swedbank", logoName: "swedbank", link: "https://www.swedbank.com/work-with-us/job-openings/index.htm")
        let company5 = Company(name: "Uber", logoName: "uber", link: "https://www.uber.com/en-SE/careers/")
        let company6 = Company(name: "Mcdonalds", logoName: "mc", link: "https://www.mcdonalds.com/se/sv-se/jobb/sok-jobb.html")
        let company7 = Company(name: "Spotify", logoName: "spotify", link: "https://www.spotifyjobs.com/")
        let company8 = Company(name: "Hemkop", logoName: "hemkop", link: "https://www.hemkop.se/jobb")
        let company9 = Company(name: "BurgerKing", logoName: "burgerking", link: "https://burgerking.se/jobb")
        let company10 = Company(name: "Volvo", logoName: "volvo", link: "https://xjobs.brassring.com/TGnewUI/Search/Home/Home?partnerid=25079&siteid=5171#home")
        let company11 = Company(name: "Blocket", logoName: "blocket", link: "https://www.blocket.career/jobs")
        let company12 = Company(name: "Polisen", logoName: "polisen", link: "https://polisen.se/Aktuellt/Lediga-jobb/")
        let company13 = Company(name: "Google", logoName: "google", link: "https://careers.google.com/locations/")
        let company14 = Company(name: "Ge", logoName: "ge", link: "https://www.ge.com/se/careers")
        let company15 = Company(name: "Uber", logoName: "uber", link: "https://www.uber.com/info/careers/eats/")
        let company16 = Company(name: "Microsoft", logoName: "microsoft", link: "https://careers.microsoft.com/")
        let company17 = Company(name: "Saab", logoName: "saab", link: "https://saabgroup.com/career/vacancies/")
        let company18 = Company(name: "H&M", logoName: "hm", link: "https://career.hm.com/content/hmcareer/en_se/findjob.html")
        
        array.append(company1)
        array.append(company2)
        array.append(company3)
        array.append(company4)
        array.append(company5)
        array.append(company6)
        array.append(company7)
        array.append(company8)
        array.append(company9)
        array.append(company10)
        array.append(company11)
        array.append(company12)
        array.append(company13)
        array.append(company14)
        array.append(company15)
        array.append(company16)
        array.append(company17)
        array.append(company18)

        return array
    }
    
    
}




