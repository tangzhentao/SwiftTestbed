//
//  CodableDemoVC.swift
//  SwiftTestbed
//
//  Created by firefly on 2020/11/16.
//

import Foundation

import UIKit

class CodableDemoVC: BaseViewController {
    
    lazy var archivedPath: String = {
        let homePath = NSHomeDirectory()
        let docPath = homePath + "/Documents"
        let teamPath = docPath + "/team"
        
        return teamPath
    }()
    
    lazy var userPath: String = {
        let homePath = NSHomeDirectory()
        let docPath = homePath + "/Documents"
        let userPath = docPath + "/user"
        
        return userPath
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let archiveItem = UIBarButtonItem(title: "归档", style: UIBarButtonItem.Style.plain, target: self, action: #selector(archivie))
//        let unachiveItem = UIBarButtonItem(title: "解档", style: UIBarButtonItem.Style.plain, target: self, action: #selector(unarchivie))
        let archiveItem = UIBarButtonItem(title: "归档", style: UIBarButtonItem.Style.plain, target: self, action: #selector(archiveUser))
        let unachiveItem = UIBarButtonItem(title: "解档", style: UIBarButtonItem.Style.plain, target: self, action: #selector(unarchiveUser))
        
        self.navigationItem.rightBarButtonItems = [archiveItem, unachiveItem]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        removeArchivedFile()
        
//        demoJson()
//        demoPlist()
//        decodeTeam()

//        archive()
//        unarchive()
//        archiveUser()
        
    }
    
    @objc func archivie () {
        print("\(type(of: self)).\(#function)")
        
        let p1 = Person(id: 1, name: "tom", age: 10, isMale: true)
        let p2 = Person(id: 2, name: "jim", age: 12, isMale: false)
        let p3 = Person(id: 3, name: "tim", age: 14, isMale: true)
        let p4 = Person(id: 4, name: "sam", age: 16, isMale: true)
        
        let members = [p1, p2, p3]
        let team = Team(master: p4, members: members)
        
        guard let plistData = try? PropertyListEncoder().encode(team) else {
            print("编码为plist失败")
            return
        }
        
        let dataPath = self.archivedPath + ".plist"
        
        do {
            try plistData.write(to: URL(fileURLWithPath: dataPath))
            print("plist data存储成功")
        } catch {
            print("plist data存储失败:", error)
        }
        
        let result = NSKeyedArchiver.archiveRootObject(plistData, toFile: self.archivedPath)
        print("archive plist data:", result)
        
        // josn
        do {
            let data = try JSONEncoder().encode(team)
            let jsonData = self.archivedPath + "_jsondata"
            do {
                try data.write(to: URL(fileURLWithPath: jsonData))
                print("json data --> file 成功")
            } catch {
                print("json data --> file 失败:", error)
            }
            
        } catch {
            print("team --> json data 失败")
        }
        
    }
    @objc func unarchivie () {
        print("\(type(of: self)).\(#function)")
        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: self.archivedPath) as? Data else {
            print("archived --> data 失败")
            return
        }
        do {
            let team = try PropertyListDecoder().decode(Team.self, from: data)
            print("解档成功")
            print("team:", team)
        } catch {
            print("data --> team 失败")
        }
    }
    
    func removeArchivedFile() {
        print("\(type(of: self)).\(#function)")
        
        
        if FileManager.default.fileExists(atPath: self.archivedPath) {
            // 存在
            
            do {
                try FileManager.default.removeItem(at: URL(fileURLWithPath: self.archivedPath))
                print("删除文件成功:", self.archivedPath)
            }
            catch {
                print("删除失败:", error)
            }
        } else {
            print("文件不存在:", self.archivedPath)
        }
    }
    
    func demoJson() {
        let p1 = Person(id: 1, name: "tom", age: 10, isMale: true)
        let p2 = Person(id: 2, name: "jim", age: 12, isMale: false)
        let p3 = Person(id: 3, name: "tim", age: 14, isMale: true)
        let p4 = Person(id: 4, name: "sam", age: 16, isMale: true)
        
        let members = [p1, p2, p3]
        let team = Team(master: p4, members: members)
        
        let jsonData = try? JSONEncoder().encode(team)
        if let data = jsonData {
            let jsonText = String(data: data, encoding: String.Encoding.utf8)
            print(jsonText ?? "")
            
            print("解码")
            let t = try? JSONDecoder().decode(Team.self, from: data)
            if let tm = t {
                print("master:", tm.master)
                for person in tm.members {
                    print("member:", person)
                }
            }
        }
    }
    
    @objc func archiveUser() {
        var user = User(name: "jim", age: 22, money: 36000.56)
        user.isMale = true
        let homePath = NSHomeDirectory()
        let docPath = homePath + "/Documents"
        let userPath = docPath + "/user"
        
        
        do {
            let data = try PropertyListEncoder().encode(user)
            let result = NSKeyedArchiver.archiveRootObject(data, toFile: userPath)
            print("archive result:", result)
        } catch {
            print("archived 失败:", error)
        }
    }
    
    @objc func unarchiveUser() {
        
        let info: [String : Any] = ["id" : 1002,
                    "is_male" : false,
                    "name" : "jobs",
                    "age" : 18,
                    "money" : 266.68,
        ]
        
        do {
            let data = try JSONSerialization.data(withJSONObject: info, options: JSONSerialization.WritingOptions.prettyPrinted)
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                print("user:", user)
            } catch {
                print("json data --> user 失败:", error)
            }
        } catch {
            print("dic --> json data 失败:", error)
        }
        
        
//        guard let user = NSKeyedUnarchiver.unarchiveObject(withFile: self.archivedPath) as? User else {
//            return
//        }
//
//        print("archived user:", user)
    }
}
