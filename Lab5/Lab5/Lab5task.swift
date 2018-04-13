//
//  lab5task.swift
//  Lab5
//
//  Created by iosdev on 23.3.2018.
//  Copyright © 2018 Metropolia. All rights reserved.
//

import Foundation

class Lab5task {
func startLoad() {
    guard let url = URL(string: "http://localhost:8080/projekti1-war/webresources/myendpoint")
        else{
            fatalError("Failed")
    }
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Client error \(error)")
            
        }
        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
                //self.handleServerError(response)
                return
        }
        if let data = data, let string = String(data: data, encoding: .utf8){
            
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
            print("json: \(json)")
            let members = json?["members"] as? [[String: Any]]
            //let memberName = members?[0]["name"] as? String
            print("\(data) \(string)")
            print("members: \(members)")
            
            // print("memberName: \(memberName)")
            for i in members!{
                print ( i ["name"]!)
            }
            
            
            /* -----------------------------
            if let name = memberName{
            print(name)
            }
             ------------------------------ */
            
            DispatchQueue.main.async {
                //self.webView.loadHTMLString(string, baseURL: url)
            }
        }
    }
    task.resume()
    }
}
