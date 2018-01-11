//
//  ViewController.swift
//  BackGroundBLE
//
//  Created by MbProRetina on 10/1/18.
//  Copyright © 2018 MbProRetina. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {

    var bleCentralManager: CBCentralManager!
    var selectedPeripheral: CBPeripheral!
    let serviceUUIDForBackgroundScanning: [CBUUID] = [CBUUID(string: "0C66E755-8B1F-41ED-B52C-37DE9EC91A69")]
    var arrayPeripheralList = Array<CBPeripheral>()
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bleCentralManagerfunc()
        
    }
    
    func bleCentralManagerfunc(){
        
        self.bleCentralManager = CBCentralManager(delegate: self, queue: DispatchQueue.main)
    }
    
    //MARK:- CBCentralManagerDelegate methods...
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
        switch central.state{
            
        case .poweredOn:    central.scanForPeripherals(withServices: nil, options: nil)
            
        default: print("Please turn on Bluetooth")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        //if !(self.arrayPeripheralList.contains(peripheral)){
            
        self.arrayPeripheralList.append(peripheral)
        print("\(i) : \(peripheral)")
        self.i = self.i + 1
        let dictionaryOfOptions = [CBCentralManagerScanOptionAllowDuplicatesKey : true]
        self.bleCentralManager.scanForPeripherals(withServices: nil, options: dictionaryOfOptions)
        //}
    }
    
    
}

