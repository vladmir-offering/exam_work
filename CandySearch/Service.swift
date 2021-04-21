protocol ServerServiceProtocol: class {
    var candies = [Candy]()
    
  var filteredCandies = [Candy]()
    func filterContentForSearchText(_ searchText: String, scope: String = "All")
}

class ServerService: ServerServiceProtocol {
    

      func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredCandies = candies.filter { candy in
            if !(candy.category == scope) && scope != "All" {
                return false
            }
            
            return candy.name.lowercased().contains(searchText.lowercased()) || searchText == ""
        }
        
        tableView.reloadData()
  }
override func fillData() {

    candies = [
        Candy(category:"Chocolate", name:"Chocolate Bar"),
        Candy(category:"Chocolate", name:"Chocolate Chip"),
        Candy(category:"Chocolate", name:"Dark Chocolate"),
        Candy(category:"Hard", name:"Lollipop"),
        Candy(category:"Hard", name:"Candy Cane"),
        Candy(category:"Hard", name:"Jaw Breaker"),
        Candy(category:"Other", name:"Caramel"),
        Candy(category:"Other", name:"Sour Chew"),
        Candy(category:"Other", name:"Gummi Bear")
    ]
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if searchController.isActive {
      return filteredCandies.count
    }
    return candies.count
  }
}