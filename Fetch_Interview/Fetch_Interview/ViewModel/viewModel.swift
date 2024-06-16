import Foundation

class ViewModel: ObservableObject {
    
    @Published var meals: [Meal] = []
    
    func fetchMeals() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let Meals  = try JSONDecoder().decode(Meals.self, from: data)
                DispatchQueue.main.async {
                    self.meals = Meals.meals
                    print("self.meals \(self.meals)")
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func fetchMealDetail(){
        
    }
    
}
