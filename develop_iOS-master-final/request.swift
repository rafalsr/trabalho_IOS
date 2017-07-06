let shows = [
        "Game Of Thrones", "HIMYM"
    ]
    
    func get_show() -> Void
    {
        let url = URL(string: "https://api.tvmaze.com/singlesearch/shows?q=game%20of%20thrones")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            print(json)
        }
        
        task.resume()
    }
