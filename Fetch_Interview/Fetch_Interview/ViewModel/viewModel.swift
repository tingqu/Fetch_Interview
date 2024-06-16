import Foundation

class ViewModel: ObservableObject {
    
    @Published var meals: [Meal] = []
    @Published var meal_detail: MealDetail?
    @Published var meal_id: String?
    
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
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func fetchMealDetail(){
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=52893") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
                do {
                    let mealResponse = try decoder.decode(MealResponse.self, from: data)
                    self.meal_detail = mealResponse.meals[0]
                } catch {
                    print("Error decoding JSON: \(error)")
                }
        }.resume()
    }
    
}
