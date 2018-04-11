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
    
    var nettoIncomeEntry = PieChartDataEntry(value: 30000)
    var taxEntry = PieChartDataEntry(value: 16345)
    var amountOfTheSalary = [PieChartDataEntry]()
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.contentSize.height = 1000
        view.isScrollEnabled = true
        return view
    }()
    
    lazy var inputSalaryView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
      //  view.backgroundColor = UIColor.blue.withAlphaComponent(0.6)
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 12
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var salaryDetailsView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 12
        view.layer.cornerRadius = 10

        return view
    }()
    
    
    lazy var salaryChart: PieChartView = {
       let chart = PieChartView()
        chart.translatesAutoresizingMaskIntoConstraints = false
        chart.chartDescription?.text = "Details of the Salary"
        chart.chartDescription?.font = UIFont.systemFont(ofSize: 10)
        chart.layer.shadowOpacity = 0.2
        chart.layer.shadowRadius = 7
        nettoIncomeEntry.label = "Netto"
        taxEntry.label = "Taxes"
        return chart
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(inputSalaryView)
        inputSalaryView.addSubview(inputTextField)
        scrollView.addSubview(salaryDetailsView)
        salaryDetailsView.addSubview(salaryChart)
        setupScrollView()
        setupSalaryDetailsView()
        setupInputView()
        amountOfTheSalary = [nettoIncomeEntry, taxEntry]
        updateChartData()
        
    }
    
    func updateChartData(){
        
        let chartDataSet = PieChartDataSet(values: amountOfTheSalary, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        let colors = [UIColor(named: "green"), UIColor(named: "orange")]
        chartDataSet.colors = colors as! [NSUIColor]
        salaryChart.data = chartData
        
    }
    
    func setupScrollView(){
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupInputView(){
        inputSalaryView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        inputSalaryView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true
        inputSalaryView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        inputSalaryView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        inputSalaryView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        inputTextField.centerYAnchor.constraint(equalTo: inputSalaryView.centerYAnchor).isActive = true
        inputTextField.centerXAnchor.constraint(equalTo: inputSalaryView.centerXAnchor).isActive = true
        inputTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        inputTextField.leftAnchor.constraint(equalTo: inputSalaryView.leftAnchor, constant: 20).isActive = true
        inputTextField.rightAnchor.constraint(equalTo: inputSalaryView.rightAnchor, constant: -20).isActive = true
        
    }

    func setupSalaryDetailsView(){
        salaryDetailsView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        salaryDetailsView.topAnchor.constraint(equalTo: inputSalaryView.bottomAnchor, constant: 20).isActive = true
        salaryDetailsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        salaryDetailsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        salaryDetailsView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        salaryChart.centerXAnchor.constraint(lessThanOrEqualTo: salaryDetailsView.centerXAnchor).isActive = true
        salaryChart.topAnchor.constraint(equalTo: salaryDetailsView.topAnchor, constant: 20).isActive = true
        salaryChart.widthAnchor.constraint(equalToConstant: 320).isActive = true
        salaryChart.heightAnchor.constraint(equalToConstant: 320).isActive = true

    }
    
    
}
