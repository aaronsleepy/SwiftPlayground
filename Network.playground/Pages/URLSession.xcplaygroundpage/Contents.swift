import Foundation

let configuration = URLSessionConfiguration.default
let session = URLSession(configuration: configuration)

let url = URL(string: "https://api.github.com/users/aaronsleepy")!

let task = session.dataTask(with: url) { data, response, error in
    guard let httpReponse = response as? HTTPURLResponse, (200..<300).contains(httpReponse.statusCode) else {
        print(">>> response \(response)")
        return
    }
    
    guard let data = data else { return }
    
    let result = String(data: data, encoding: .utf8)
    print(result)
}

task.resume()
