import Foundation

enum Keys: String {
    case countOfMoney = "countOfMoney"
    case balls = "balls"
    case highScores = "highScores"
}

class UserDefaultsManager {
    static let defaults = UserDefaults.standard
    
    let arrayOfBall = [BallModel(image: BallImageName.ball1.rawValue,
                                 name: "CLASSIC BALL",
                                 countWorth: "75",
                                 isSelected: true,
                                 isAvailible: false),
                       BallModel(image: BallImageName.ball2.rawValue,
                                 name: "VIOLET BALL",
                                 countWorth: "75",
                                 isSelected: false,
                                 isAvailible: false),
                       BallModel(image: BallImageName.ball3.rawValue,
                                 name: "GREEN BALL",
                                 countWorth: "75",
                                 isSelected: false,
                                 isAvailible: false),
                       BallModel(image: BallImageName.ball4.rawValue,
                                 name: "PINK BALL",
                                 countWorth: "75",
                                 isSelected: false,
                                 isAvailible: false)]
    
    func firstLaunch() {
        if UserDefaultsManager.defaults.string(forKey: Keys.countOfMoney.rawValue) == nil {
            UserDefaultsManager.defaults.set(225, forKey: Keys.countOfMoney.rawValue)
            saveBalls(array: arrayOfBall)
        }
    }
    
    func completeLevel(countOfMoney: Int) {
        let money = UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0
        UserDefaultsManager.defaults.set(money + countOfMoney, forKey: Keys.countOfMoney.rawValue)
    }
    
    func saveBalls(array: [BallModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(array) {
            UserDefaultsManager.defaults.set(encoded, forKey: Keys.balls.rawValue)
        }
    }
    
    func loadBalls() -> [BallModel]? {
        if let savedBallsData = UserDefaultsManager.defaults.data(forKey: Keys.balls.rawValue) {
            let decoder = JSONDecoder()
            if let loadedBalls = try? decoder.decode([BallModel].self, from: savedBallsData) {
                return loadedBalls
            }
        }
        return nil
    }
    
    func manageBall(at index: Int) {
        var balls = loadBalls() ?? []
        
        guard index >= 0 && index < balls.count else {
            return
        }
        
        let selectedBall = balls[index]
        
        if selectedBall.isSelected {
            return
        }
        
        if selectedBall.isAvailible {
            for i in 0..<balls.count {
                if balls[i].isSelected {
                    balls[i].isSelected = false
                    balls[i].isAvailible = true
                    break
                }
            }
            
            balls[index].isSelected = true
            balls[index].isAvailible = false
        } else {
            let countOfMoney = UserDefaultsManager.defaults.integer(forKey: Keys.countOfMoney.rawValue)
            if countOfMoney >= 75 {
                let userWantsToBuy = true
                if userWantsToBuy {
                    balls[index].isAvailible = true
                    for i in 0..<balls.count {
                        if balls[i].isSelected {
                            balls[i].isSelected = false
                            balls[i].isAvailible = true
                            break
                        }
                    }
                    
                    balls[index].isSelected = true
                    balls[index].isAvailible = false
                    UserDefaultsManager.defaults.set(countOfMoney - 75, forKey: Keys.countOfMoney.rawValue)
                }
            }
        }
        saveBalls(array: balls)
    }
    
    func getSelectedBallImage() -> String? {
        let balls = loadBalls() ?? []
        for ball in balls {
            if ball.isSelected {
                return ball.image
            }
        }
        return nil
    }
    
    func addScore(_ score: Int) {
        var scores = loadScores()
        scores.append(score)
        saveScores(scores)
    }
    
    func getHighestScore() -> String {
        let scores = loadScores()
        guard let highestScore = scores.max() else {
            return "0"
        }
        return "\(highestScore)"
    }
    
    private func saveScores(_ scores: [Int]) {
        UserDefaultsManager.defaults.set(scores, forKey: Keys.highScores.rawValue)
    }
    
    private func loadScores() -> [Int] {
        return UserDefaultsManager.defaults.array(forKey: Keys.highScores.rawValue) as? [Int] ?? []
    }
}
