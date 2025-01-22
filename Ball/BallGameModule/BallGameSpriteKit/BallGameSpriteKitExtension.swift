import SwiftUI
import SpriteKit

extension BallGameSpriteKit {
    func setupView() {
        let gameBackground = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.mainBackground.rawValue))
        gameBackground.size = CGSize(width: size.width, height: size.height)
        gameBackground.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(gameBackground)
        
        let shadowMainBackground = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.shadowMainBackground.rawValue))
        shadowMainBackground.size = CGSize(width: size.width, height: size.height)
        shadowMainBackground.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(shadowMainBackground)
        
        bottomBorder = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.bottomBorder.rawValue))
        bottomBorder.size = CGSize(width: size.width * 0.94, height: size.height * 0.059)
        bottomBorder.physicsBody = SKPhysicsBody(texture: bottomBorder.texture!, size: bottomBorder.size)
        bottomBorder.name = "bottomBorder"
        bottomBorder.physicsBody?.isDynamic = false
        
        bottomBorder.physicsBody?.categoryBitMask = CBitMask.border
        bottomBorder.position = CGPoint(x: size.width / 2, y: size.height / 5.5)
        addChild(bottomBorder)
        
        straightLine = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.straightLine.rawValue))
        straightLine.size = CGSize(width: size.width * 0.012, height: size.height * 0.65)
        straightLine.physicsBody = SKPhysicsBody(texture: straightLine.texture!, size: straightLine.size)
        straightLine.physicsBody?.isDynamic = false
        straightLine.position = CGPoint(x: size.width / 1.12, y: size.height / 1.75)
        addChild(straightLine)
        
        straightLine2 = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.straightLine.rawValue))
        straightLine2.size = CGSize(width: size.width * 0.012, height: size.height * 0.65)
        straightLine2.physicsBody = SKPhysicsBody(texture: straightLine2.texture!, size: straightLine2.size)
        straightLine2.physicsBody?.isDynamic = false
        straightLine2.position = CGPoint(x: size.width / 10, y: size.height / 1.75)
        addChild(straightLine2)
        
        let leftLine = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.leftLine.rawValue))
        leftLine.physicsBody = SKPhysicsBody(texture: leftLine.texture!,
                                             size: CGSize(width: size.width * 0.34, height: size.height * 0.1))
        leftLine.physicsBody?.isDynamic = false
        leftLine.size = CGSize(width: size.width * 0.35, height: size.height * 0.1)
        leftLine.position = CGPoint(x: size.width / 3.7, y: size.height / 1.18)
        addChild(leftLine)
        
        let rightLine = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.rightLine.rawValue))
        rightLine.physicsBody = SKPhysicsBody(texture: rightLine.texture!,
                                              size: CGSize(width: size.width * 0.34, height: size.height * 0.1))
        rightLine.physicsBody?.isDynamic = false
        rightLine.size = CGSize(width: size.width * 0.35, height: size.height * 0.1)
        rightLine.position = CGPoint(x: size.width / 1.39, y: size.height / 1.18)
        addChild(rightLine)
        
        let sightToTop = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.sightToTop.rawValue))
        sightToTop.size = CGSize(width: 10, height: 32)
        sightToTop.position = CGPoint(x: size.width / 1.05, y: size.height / 3.6)
        addChild(sightToTop)
        
        let sightToTop2 = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.sightToTop.rawValue))
        sightToTop2.size = CGSize(width: 10, height: 32)
        sightToTop2.position = CGPoint(x: size.width / 19, y: size.height / 3.6)
        addChild(sightToTop2)
        
        linePunctir = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.linePunctir.rawValue))
        linePunctir.size = CGSize(width: size.width * 0.32, height: 3)
        linePunctir.position = CGPoint(x: size.width / 3.8, y: size.height / 1.25)
        addChild(linePunctir)
        
        linePunctir2 = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.linePunctir.rawValue))
        linePunctir2.size = CGSize(width: size.width * 0.32, height: 3)
        linePunctir2.position = CGPoint(x: size.width / 1.37, y: size.height / 1.25)
        addChild(linePunctir2)
        
        let timeLabel = SKLabelNode(fontNamed: "BigshotOne-Regular")
        timeLabel.name = "timeLabel"
        timeLabel.attributedText = NSAttributedString(string: "TIME:", attributes: [
            NSAttributedString.Key.font: UIFont(name: "BigshotOne-Regular", size: 18)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -1
        ])
        timeLabel.position = CGPoint(x: size.width / 5.2, y: size.height / 1.205)
        addChild(timeLabel)
        
        time = SKLabelNode(fontNamed: "BigshotOne-Regular")
        time.name = "time"
        time.attributedText = NSAttributedString(string:"\(String(describing: (game?.timeWent ?? 0) / 60)):\(String(describing: (game?.timeWent ?? 0) % 60))", attributes: [
            NSAttributedString.Key.font: UIFont(name: "BigshotOne-Regular", size: 18)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -1
        ])
        time.position = CGPoint(x: size.width / 5.2, y: size.height / 1.235)
        addChild(time)
        
        scoreLabel = SKLabelNode(fontNamed: "BigshotOne-Regular")
        scoreLabel.name = "scoreLabel"
        scoreLabel.attributedText = NSAttributedString(string: "\(game?.currentScore ?? 0)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "BigshotOne-Regular", size: 36)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -3
        ])
        scoreLabel.position = CGPoint(x: size.width / 1.3, y: size.height / 1.24)
        addChild(scoreLabel)
        
        ball = SKSpriteNode(texture: SKTexture(imageNamed: UserDefaultsManager().getSelectedBallImage() ?? BallImageName.ball1.rawValue))
        ball.name = "ball"
        ball.size = CGSize(width: 20, height: 20)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 8)
        ball.physicsBody?.contactTestBitMask = CBitMask.border | CBitMask.obstacle
        ball.physicsBody?.categoryBitMask = CBitMask.ball
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.affectedByGravity = false
        ball.position = CGPoint(x: size.width / 2.03, y: size.height / 1.25)
        addChild(ball)
        
        arrow = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.tapHoldEffect.rawValue))
        arrow.name = "arrow"
        arrow.size = CGSize(width: 10,
                            height: size.height * 0.294)
        arrow.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        arrow.position = CGPoint(x: size.width / 2.03, y: size.height / 1.3)
        arrow.isHidden = true
        addChild(arrow)
        
        let array = [BallImageName.obstacle1.rawValue,
                     BallImageName.obstacle2.rawValue,
                     BallImageName.obstacle3.rawValue,
                     BallImageName.obstacle4.rawValue]
        
        createObstacles(arrayOfImageObstacle: array, valueForObstacle: [1], duration: 0)
        
        let backForWeapon = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.squareButtonBackground.rawValue))
        backForWeapon.size = CGSize(width: 72, height: 72)
        backForWeapon.name = "backForWeapon"
        backForWeapon.position = CGPoint(x: size.width / 3.5, y: size.height / 10)
        addChild(backForWeapon)
        
        weapon = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.weapon.rawValue))
        weapon.size = CGSize(width: 38, height: 38)
        weapon.name = "weapon"
        weapon.position = CGPoint(x: size.width / 3.5, y: size.height / 10)
        addChild(weapon)
        
        let backForPause = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.squareButtonBackground.rawValue))
        backForPause.size = CGSize(width: 72, height: 72)
        backForPause.name = "backForPause"
        backForPause.position = CGPoint(x: size.width / 2, y: size.height / 10)
        addChild(backForPause)
        
        let pause = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.pause.rawValue))
        pause.size = CGSize(width: 35, height: 35)
        pause.name = "pause"
        pause.position = CGPoint(x: size.width / 2, y: size.height / 10.5)
        addChild(pause)
        
        let backForRocket = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.squareButtonBackground.rawValue))
        backForRocket.size = CGSize(width: 72, height: 72)
        backForRocket.name = "backForRocket"
        backForRocket.position = CGPoint(x: size.width / 1.4, y: size.height / 10)
        addChild(backForRocket)
        
        let rocket = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.rocket.rawValue))
        rocket.size = CGSize(width: 38, height: 38)
        rocket.name = "rocket"
        rocket.position = CGPoint(x: size.width / 1.4, y: size.height / 10)
        addChild(rocket)
        
        let countOfMoneyForWeapon = SKLabelNode(fontNamed: "BigshotOne-Regular")
        countOfMoneyForWeapon.name = "countOfMoneyForWeapon"
        countOfMoneyForWeapon.attributedText = NSAttributedString(string: "50", attributes: [
            NSAttributedString.Key.font: UIFont(name: "BigshotOne-Regular", size: 24)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -3
        ])
        countOfMoneyForWeapon.position = CGPoint(x: size.width / 4, y: size.height / 40)
        addChild(countOfMoneyForWeapon)
        
        let coin1 = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.coin.rawValue))
        coin1.size = CGSize(width: 28, height: 28)
        coin1.name = "coin1"
        coin1.position = CGPoint(x: size.width / 3, y: size.height / 26)
        addChild(coin1)
        
        let countOfMoneyForRocket = SKLabelNode(fontNamed: "BigshotOne-Regular")
        countOfMoneyForRocket.name = "countOfMoneyForRocket"
        countOfMoneyForRocket.attributedText = NSAttributedString(string: "100", attributes: [
            NSAttributedString.Key.font: UIFont(name: "BigshotOne-Regular", size: 24)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -3
        ])
        countOfMoneyForRocket.position = CGPoint(x: size.width / 1.45, y: size.height / 40)
        addChild(countOfMoneyForRocket)
        
        let coin2 = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.coin.rawValue))
        coin2.size = CGSize(width: 28, height: 28)
        coin2.name = "coin2"
        coin2.position = CGPoint(x: size.width / 1.26, y: size.height / 26)
        addChild(coin2)
        
        countOfMyMoney = SKLabelNode(fontNamed: "BigshotOne-Regular")
        countOfMyMoney.name = "countOfMoneyForRocket"
        countOfMyMoney.attributedText = NSAttributedString(string: "\(UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "BigshotOne-Regular", size: 36)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -3
        ])
        countOfMyMoney.position = CGPoint(x: size.width / 2.2, y: size.height / 1.17)
        addChild(countOfMyMoney)
        
        let coin3 = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.coin.rawValue))
        coin3.size = CGSize(width: 30, height: 30)
        coin3.name = "coin3"
        coin3.position = CGPoint(x: size.width / 1.78, y: size.height / 1.147)
        addChild(coin3)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: self.speed == 1.0 ? 1.0 : 0.5, repeats: true) { _ in
            self.updateTimer()
        }
    }
    
    func updateTimer() {
        guard !game!.isPause else { return }
        game?.timeWent += 1
        time.attributedText = NSAttributedString(string:"\(String(describing: (game?.timeWent ?? 0) / 60)):\(String(describing: (game?.timeWent ?? 0) % 60))", attributes: [
            NSAttributedString.Key.font: UIFont(name: "BigshotOne-Regular", size: 18)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -1
        ])
    }
    
    func startScoreTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.0, repeats: true) { _ in
            self.updateScoreTimer()
        }
    }
    
    func updateScoreTimer() {
        guard !game!.isPause else { return }
        scoreLabel.attributedText = NSAttributedString(string: "\(game?.currentScore ?? 0)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "BigshotOne-Regular", size: 36)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -3
        ])
    }
    
    func moveBall(toDirection direction: Direction) {
        guard !hasContactOccurred else { return }
        hasContactOccurred = true
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        let moveAction: SKAction
        let targetX: CGFloat
        
        self.enumerateChildNodes(withName: "obstacle") { (node, stop) in
            let moveUp = SKAction.moveBy(x: 0, y: 100, duration: self.speed == 1.0 ? 1.0 : 0.5)
            node.run(moveUp)
        }
        
        let array = [BallImageName.redObsctacle1.rawValue,
                     BallImageName.redObsctacle2.rawValue,
                     BallImageName.redObsctacle3.rawValue,
                     BallImageName.redObsctacle4.rawValue,
                     
                     BallImageName.greenObstacle1.rawValue,
                     BallImageName.greenObstacle2.rawValue,
                     BallImageName.greenObstacle3.rawValue,
                     BallImageName.greenObstacle4.rawValue,
                     
                     BallImageName.blueObstacle1.rawValue,
                     BallImageName.blueObstacle2.rawValue,
                     BallImageName.blueObstacle3.rawValue,
                     BallImageName.blueObstacle4.rawValue,
                     
                     BallImageName.obstacle1.rawValue,
                     BallImageName.obstacle2.rawValue,
                     BallImageName.obstacle3.rawValue,
                     BallImageName.obstacle4.rawValue]
        
        let randomValueForObstacle = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
        
        createObstacles(arrayOfImageObstacle: array,
                        valueForObstacle: randomValueForObstacle,
                        duration: 1)
        
        switch direction {
        case .left:
            targetX = straightLine2.position.x - 20
        case .right:
            targetX = straightLine.position.x + 20
        }
        
        moveAction = SKAction.moveTo(x: targetX, duration: 1)
        let liftAction = SKAction.moveBy(x: 0, y: 811, duration: 0.5)
        let shiftDirection: CGFloat = (direction == .left) ? 150 : -150
        let shiftAction = SKAction.moveBy(x: shiftDirection, y: 0, duration: 0.3)
        let sequence = SKAction.sequence([moveAction, liftAction, shiftAction])
        
        ball.run(sequence) {
            self.hasContactOccurred = false
            
            self.ball.physicsBody?.restitution = 1
            self.ball.physicsBody?.affectedByGravity = true
            
        }
    }
    
    func createObstacles(arrayOfImageObstacle: [String], valueForObstacle: [Int], duration: Int) {
        let randomValue = -5...10
        for i in 0...4 {
            let node = SKSpriteNode(texture: SKTexture(imageNamed: arrayOfImageObstacle.randomElement() ?? ""))
            node.size = CGSize(width: 50, height: 50)
            node.position.y = 0
            node.position.x = 0
            
            let numberOnNode = SKLabelNode(fontNamed: "BigshotOne-Regular")
            numberOnNode.name = "numberNode"
            numberOnNode.attributedText = NSAttributedString(string: "\(valueForObstacle.randomElement() ?? 1)", attributes: [
                NSAttributedString.Key.font: UIFont(name: "BigshotOne-Regular", size: 24)!,
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.strokeColor: UIColor.white,
                NSAttributedString.Key.strokeWidth: -1
            ])
            numberOnNode.position.y = -7
            numberOnNode.position.x = 0
            
            obstacle = SKNode()
            obstacle.name = "obstacle"
            obstacle.physicsBody = SKPhysicsBody(texture: node.texture!, size: CGSize(width: 50, height: 50))
            obstacle.physicsBody?.isDynamic = false
            obstacle.physicsBody?.categoryBitMask = CBitMask.obstacle
            obstacle.addChild(node)
            obstacle.addChild(numberOnNode)
            
            obstacle.position = CGPoint(x: size.width / 5.1 + CGFloat(i * 55),
                                        y: size.height / 3.5 + CGFloat(i * randomValue.randomElement()!))
            addChild(obstacle)
            obstacle.alpha = 0
            let fadeIn = SKAction.fadeIn(withDuration: TimeInterval(duration))
            let showAnimation = SKAction.sequence([fadeIn])
            obstacle.run(showAnimation)
        }
    }
    
    func increaseSpeed(node: SKNode) {
        if node.name == "light" {
            ball.speed = 1.2
            node.removeFromParent()
        }
    }
    
    func useWeapon(node: SKNode) {
        guard isRocketOpacity != true else { return }
        if node.name == "weapon" || node.name == "weaponBackground" {
            let countOfMoney = UserDefaults.standard.integer(forKey: Keys.countOfMoney.rawValue)
            if countOfMoney >= 50 {
                
                
                isWeaponOpacity.toggle()
                node.alpha = isWeaponOpacity ? 0.5 : 1
            } else {
                let notEnoughtMoney = SKLabelNode(fontNamed: "BigshotOne-Regular")
                notEnoughtMoney.name = "timeLabel"
                notEnoughtMoney.attributedText = NSAttributedString(string: "NOT ENOUGH MONEY!", attributes: [
                    NSAttributedString.Key.font: UIFont(name: "BigshotOne-Regular", size: 18)!,
                    NSAttributedString.Key.foregroundColor: UIColor.white,
                    NSAttributedString.Key.strokeColor: UIColor.black,
                    NSAttributedString.Key.strokeWidth: -1
                ])
                notEnoughtMoney.position = CGPoint(x: node.position.x, y: node.position.y + 50)
                if let scene = node.scene {
                    scene.addChild(notEnoughtMoney)
                    let fadeOutAction = SKAction.fadeOut(withDuration: 2.0)
                    let waitAction = SKAction.wait(forDuration: 1.0)
                    let removeAction = SKAction.removeFromParent()
                    notEnoughtMoney.run(SKAction.sequence([fadeOutAction, waitAction, removeAction]))
                }
            }
        }
    }
    
    func removeObstacleWithWeapon(node: SKNode) {
        if isWeaponOpacity {
            if node.parent?.name == "obstacle" {
                let replacementNode = SKSpriteNode(imageNamed: BallImageName.animationRemoveObstacle.rawValue)
                replacementNode.size = CGSize(width: 50, height: 50)
                replacementNode.position = node.parent!.position
                node.parent?.removeFromParent()
                addChild(replacementNode)
                let fadeOutOriginal = SKAction.fadeOut(withDuration: 0.2)
                
                replacementNode.run(fadeOutOriginal) {
                    replacementNode.removeFromParent()
                    
                }
                
                isWeaponOpacity.toggle()
                weapon.alpha = isWeaponOpacity ? 0.5 : 1
                
                let countOfMoney = UserDefaultsManager.defaults.integer(forKey: Keys.countOfMoney.rawValue)
                UserDefaultsManager.defaults.set(countOfMoney - 50, forKey: Keys.countOfMoney.rawValue)
                countOfMyMoney.attributedText = NSAttributedString(string: "\(UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0)", attributes: [
                    NSAttributedString.Key.font: UIFont(name: "BigshotOne-Regular", size: 36)!,
                    NSAttributedString.Key.foregroundColor: UIColor.white,
                    NSAttributedString.Key.strokeColor: UIColor.black,
                    NSAttributedString.Key.strokeWidth: -3
                ])
            }
        }
    }
    
    func useRocket(node: SKNode) {
        guard isWeaponOpacity != true else { return }
        if node.name == "rocket" || node.name == "rocketBackground" {
            let countOfMoney = UserDefaults.standard.integer(forKey: Keys.countOfMoney.rawValue)
            if countOfMoney >= 100 {
                let countOfMoney = UserDefaultsManager.defaults.integer(forKey: Keys.countOfMoney.rawValue)
                UserDefaultsManager.defaults.set(countOfMoney - 100, forKey: Keys.countOfMoney.rawValue)
                countOfMyMoney.attributedText = NSAttributedString(string: "\(UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0)", attributes: [
                    NSAttributedString.Key.font: UIFont(name: "BigshotOne-Regular", size: 36)!,
                    NSAttributedString.Key.foregroundColor: UIColor.white,
                    NSAttributedString.Key.strokeColor: UIColor.black,
                    NSAttributedString.Key.strokeWidth: -3
                ])
                
                isRocketOpacity.toggle()
                node.alpha = isRocketOpacity ? 0.5 : 1
                
                if isRocketOpacity {
                    let boomLabel = SKSpriteNode(imageNamed: BallImageName.boomLabel.rawValue)
                    boomLabel.size = CGSize(width: 378, height: 378)
                    boomLabel.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
                    boomLabel.zPosition = 2
                    self.addChild(boomLabel)
                    boomLabel.alpha = 0
                    
                    let fadeIn = SKAction.fadeIn(withDuration: TimeInterval(0.5))
                    boomLabel.run(fadeIn)
                    
                    ball.physicsBody?.isDynamic = false
                    
                    self.enumerateChildNodes(withName: "obstacle") { (node, stop) in
                        node.removeFromParent()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.ball.physicsBody?.isDynamic = true
                        boomLabel.removeFromParent()
                        self.isRocketOpacity.toggle()
                        node.alpha = self.isRocketOpacity ? 0.5 : 1
                    }
                }
            } else {
                let notEnoughtMoney = SKLabelNode(fontNamed: "BigshotOne-Regular")
                notEnoughtMoney.name = "timeLabel"
                notEnoughtMoney.attributedText = NSAttributedString(string: "NOT ENOUGH MONEY!", attributes: [
                    NSAttributedString.Key.font: UIFont(name: "BigshotOne-Regular", size: 18)!,
                    NSAttributedString.Key.foregroundColor: UIColor.white,
                    NSAttributedString.Key.strokeColor: UIColor.black,
                    NSAttributedString.Key.strokeWidth: -1
                ])
                notEnoughtMoney.position = CGPoint(x: node.position.x, y: node.position.y + 50)
                if let scene = node.scene {
                    scene.addChild(notEnoughtMoney)
                    let fadeOutAction = SKAction.fadeOut(withDuration: 2.0)
                    let waitAction = SKAction.wait(forDuration: 1.0)
                    let removeAction = SKAction.removeFromParent()
                    notEnoughtMoney.run(SKAction.sequence([fadeOutAction, waitAction, removeAction]))
                }
            }
        }
    }
    
    func gameOver() {
        hideNodes()
        game?.isPause = true
        scene?.isPaused = game!.isPause
        
        let gameOver = SKLabelNode(fontNamed: "BigshotOne-Regular")
        gameOver.attributedText = NSAttributedString(string: "GAME OVER!", attributes: [
            NSAttributedString.Key.font: UIFont(name: "BigshotOne-Regular", size: 46)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -1
        ])
        gameOver.position = CGPoint(x: size.width / 2, y: size.height / 1.42)
        addChild(gameOver)
        
        let timeLabel = SKLabelNode(fontNamed: "BigshotOne-Regular")
        timeLabel.attributedText = NSAttributedString(string: "TIME: ", attributes: [
            NSAttributedString.Key.font: UIFont(name: "BigshotOne-Regular", size: 30)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -1
        ])
        timeLabel.position = CGPoint(x: size.width / 2, y: size.height / 1.57)
        addChild(timeLabel)
        
        let time = SKLabelNode(fontNamed: "BigshotOne-Regular")
        time.attributedText = NSAttributedString(string: "\(game!.timeWent / 60):\(game!.timeWent % 60)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "BigshotOne-Regular", size: 30)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -1
        ])
        time.position = CGPoint(x: size.width / 2, y: size.height / 1.65)
        addChild(time)
        
        let scoreLabel = SKLabelNode(fontNamed: "BigshotOne-Regular")
        scoreLabel.attributedText = NSAttributedString(string: "Score:", attributes: [
            NSAttributedString.Key.font: UIFont(name: "BigshotOne-Regular", size: 48)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -1
        ])
        scoreLabel.position = CGPoint(x: size.width / 2, y: size.height / 1.8)
        addChild(scoreLabel)
        
        let score = SKLabelNode(fontNamed: "BigshotOne-Regular")
        score.attributedText = NSAttributedString(string: "\(game!.currentScore)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "BigshotOne-Regular", size: 48)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -1
        ])
        score.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(score)
        
        let bestScoreLabel = SKLabelNode(fontNamed: "BigshotOne-Regular")
        bestScoreLabel.attributedText = NSAttributedString(string: "Best Score:", attributes: [
            NSAttributedString.Key.font: UIFont(name: "BigshotOne-Regular", size: 48)!,
            NSAttributedString.Key.foregroundColor: UIColor.orange,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -1
        ])
        bestScoreLabel.position = CGPoint(x: size.width / 2, y: size.height / 2.3)
        addChild(bestScoreLabel)
        
        let bestScore = SKLabelNode(fontNamed: "BigshotOne-Regular")
        bestScore.attributedText = NSAttributedString(string: "\(UserDefaultsManager().getHighestScore())", attributes: [
            NSAttributedString.Key.font: UIFont(name: "BigshotOne-Regular", size: 48)!,
            NSAttributedString.Key.foregroundColor: UIColor.orange,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -1
        ])
        bestScore.position = CGPoint(x: size.width / 2, y: size.height / 2.6)
        addChild(bestScore)
        
        let backForHome = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.squareButtonBackground.rawValue))
        backForHome.size = CGSize(width: 71, height: 71)
        backForHome.name = "backForHome"
        backForHome.position = CGPoint(x: size.width / 3.5, y: size.height / 3.2)
        addChild(backForHome)
        
        let home = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.home.rawValue))
        home.size = CGSize(width: 33, height: 33)
        home.name = "home"
        home.position = CGPoint(x: size.width / 3.5, y: size.height / 3.2)
        addChild(home)
        
        let backForPlay = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.squareButtonBackground.rawValue))
        backForPlay.size = CGSize(width: 71, height: 71)
        backForPlay.name = "backForPlay2"
        backForPlay.position = CGPoint(x: size.width / 2, y: size.height / 3.2)
        addChild(backForPlay)
        
        let play = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.play.rawValue))
        play.size = CGSize(width: 30, height: 30)
        play.name = "play2"
        play.position = CGPoint(x: size.width / 2, y: size.height / 3.21)
        addChild(play)
        
        let backForRetry = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.squareButtonBackground.rawValue))
        backForRetry.size = CGSize(width: 71, height: 71)
        backForRetry.name = "backForRetry"
        backForRetry.position = CGPoint(x: size.width / 1.4, y: size.height / 3.2)
        addChild(backForRetry)
        
        let retry = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.retry.rawValue))
        retry.size = CGSize(width: 41, height: 41)
        retry.name = "retry"
        retry.position = CGPoint(x: size.width / 1.4, y: size.height / 3.2)
        addChild(retry)
        
        let backForSound = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.squareButtonBackground.rawValue))
        backForSound.size = CGSize(width: 61, height: 61)
        backForSound.name = "backForSound"
        backForSound.position = CGPoint(x: size.width / 2.5, y: size.height / 4.5)
        addChild(backForSound)
        
        let sound = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.soundImage.rawValue))
        sound.size = CGSize(width: 28, height: 28)
        sound.name = "sound"
        sound.position = CGPoint(x: size.width / 2.5, y: size.height / 4.5)
        addChild(sound)
        
        let backForMusic = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.squareButtonBackground.rawValue))
        backForMusic.size = CGSize(width: 61, height: 61)
        backForMusic.name = "backForMusic"
        backForMusic.position = CGPoint(x: size.width / 1.7, y: size.height / 4.5)
        addChild(backForMusic)
        
        let music = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.musicImage.rawValue))
        music.size = CGSize(width: 28, height: 28)
        music.name = "music"
        music.position = CGPoint(x: size.width / 1.7, y: size.height / 4.5)
        addChild(music)
    }
    
    func hideNodes() {
        let namesToHide = ["pause", "backForPause", "rocket", "backForRocket", "weapon", "backForWeapon", "coin2", "coin1", "countOfMoneyForRocket", "countOfMoneyForWeapon", "obstacle", "light", "timeLabel", "time", "scoreLabel", "ball", "coin3"]
        for name in namesToHide {
            self.enumerateChildNodes(withName: name) { (node, stop) in
                node.isHidden = true
            }
        }
    }
    
    func isBallOutside() {
        if !ball.intersects(scene!) {
            ball.position = CGPoint(x: size.width / 2, y: size.height / 1)
            ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        }
    }
    
    func isIntrejectLine() {
        enumerateChildNodes(withName: "obstacle") { (node, stop) in
            if node.position.y + 25 > self.linePunctir.position.y {
                UserDefaultsManager().addScore(self.game?.currentScore ?? 0)
                self.gameOver()
            }
        }
    }
    
    func showNodes() {
        let namesToShow = ["pause", "backForPause", "rocket", "backForRocket", "weapon", "backForWeapon", "coin2", "coin1", "countOfMoneyForRocket", "countOfMoneyForWeapon", "obstacle", "light", "timeLabel", "time", "scoreLabel", "ball", "coin3"]
        for name in namesToShow {
            self.enumerateChildNodes(withName: name) { (node, stop) in
                node.isHidden = false
            }
        }
    }
    
    func hidePause() {
        let namesToHide = ["gamePuase", "backForHome", "home", "backForPlay", "play", "backForRetry", "retry", "backForSound", "sound", "backForMusic", "music"]
        for name in namesToHide {
            self.enumerateChildNodes(withName: name) { (node, stop) in
                node.isHidden = true
            }
        }
    }
    
    func showPause() {
        let gamePuase = SKLabelNode(fontNamed: "BigshotOne-Regular")
        gamePuase.name = "gamePuase"
        gamePuase.attributedText = NSAttributedString(string: "GAME IS PAUSED", attributes: [
            NSAttributedString.Key.font: UIFont(name: "BigshotOne-Regular", size: 36)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -1
        ])
        gamePuase.position = CGPoint(x: size.width / 2, y: size.height / 1.7)
        addChild(gamePuase)
        
        let backForHome = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.squareButtonBackground.rawValue))
        backForHome.size = CGSize(width: 71, height: 71)
        backForHome.name = "backForHome"
        backForHome.position = CGPoint(x: size.width / 3.5, y: size.height / 2.5)
        addChild(backForHome)
        
        let home = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.home.rawValue))
        home.size = CGSize(width: 33, height: 33)
        home.name = "home"
        home.position = CGPoint(x: size.width / 3.5, y: size.height / 2.5)
        addChild(home)
        
        let backForPlay = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.squareButtonBackground.rawValue))
        backForPlay.size = CGSize(width: 71, height: 71)
        backForPlay.name = "backForPlay"
        backForPlay.position = CGPoint(x: size.width / 2, y: size.height / 2.5)
        addChild(backForPlay)
        
        let play = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.play.rawValue))
        play.size = CGSize(width: 30, height: 30)
        play.name = "play"
        play.position = CGPoint(x: size.width / 2, y: size.height / 2.51)
        addChild(play)
        
        let backForRetry = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.squareButtonBackground.rawValue))
        backForRetry.size = CGSize(width: 71, height: 71)
        backForRetry.name = "backForRetry"
        backForRetry.position = CGPoint(x: size.width / 1.4, y: size.height / 2.5)
        addChild(backForRetry)
        
        let retry = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.retry.rawValue))
        retry.size = CGSize(width: 41, height: 41)
        retry.name = "retry"
        retry.position = CGPoint(x: size.width / 1.4, y: size.height / 2.5)
        addChild(retry)
        
        let backForSound = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.squareButtonBackground.rawValue))
        backForSound.size = CGSize(width: 61, height: 61)
        backForSound.name = "backForSound"
        backForSound.position = CGPoint(x: size.width / 2.5, y: size.height / 3.3)
        addChild(backForSound)
        
        let sound = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.soundImage.rawValue))
        sound.size = CGSize(width: 28, height: 28)
        sound.name = "sound"
        sound.position = CGPoint(x: size.width / 2.5, y: size.height / 3.3)
        addChild(sound)
        
        let backForMusic = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.squareButtonBackground.rawValue))
        backForMusic.size = CGSize(width: 61, height: 61)
        backForMusic.name = "backForMusic"
        backForMusic.position = CGPoint(x: size.width / 1.7, y: size.height / 3.3)
        addChild(backForMusic)
        
        let music = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.musicImage.rawValue))
        music.size = CGSize(width: 28, height: 28)
        music.name = "music"
        music.position = CGPoint(x: size.width / 1.7, y: size.height / 3.3)
        addChild(music)
    }
    
    func pauseGame(node: SKNode) {
        if node.name == "backForPause" || node.name == "pause" {
            game!.isPause.toggle()
            scene?.isPaused = game!.isPause
            hideNodes()
            showPause()
        }
    }
    
    func pauseOff(node: SKNode) {
        if node.name == "play" || node.name == "backForPlay" {
            if game!.isPause == true {
                hidePause()
                showNodes()
                game!.isPause.toggle()
                scene?.isPaused = game!.isPause
            }
        }
    }
    
    func goToMenu(node: SKNode) {
        if node.name == "home" || node.name == "backForHome" {
            if game!.isPause == true {
                game!.isMenu = true
            }
        }
    }
    
    func toggleSound(node: SKNode) {
        if node.name == "sound" {
            if game!.isPause == true {
                isSoundOff.toggle()
                let newTexture = SKTexture(imageNamed: isSoundOff ? BallImageName.soundOffImage.rawValue : BallImageName.soundImage.rawValue)
                let skNode = node as? SKSpriteNode
                skNode?.texture = newTexture
            }
        }
    }
    
    func toggleMusic(node: SKNode) {
        if node.name == "music" {
            if game!.isPause == true {
                isMusicOff.toggle()
                let newTexture = SKTexture(imageNamed: isMusicOff ? BallImageName.musicOffImage.rawValue : BallImageName.musicImage.rawValue)
                let skNode = node as? SKSpriteNode
                skNode?.texture = newTexture
            }
        }
    }
    
    func resetScene(node: SKNode) {
        guard let game = game else { return }
        if node.name == "retry" || node.name == "backForRetry" || node.name == "backForPlay2" || node.name == "play2" {
            game.isRestart = true
        }
    }
    
    func moveNodeTo(location: CGPoint) {
        let lowerBound: CGFloat = size.height / 1.4
        let upperBound: CGFloat = size.height / 1.21
        
        if ball.position.y >= lowerBound && ball.position.y <= upperBound {
            let dx = location.x - ball.position.x
            let dy = location.y - ball.position.y
            let impulseScale: CGFloat = 0.05
            let impulse = CGVector(dx: dx * impulseScale, dy: dy * impulseScale)
            ball.physicsBody?.affectedByGravity = true
            ball.physicsBody?.applyImpulse(impulse)
            
            if !isLightDeleted {
                let light = SKSpriteNode(texture: SKTexture(imageNamed: BallImageName.light.rawValue))
                light.size = CGSize(width: 52, height: 52)
                light.name = "light"
                light.zPosition = 2
                light.position = CGPoint(x: size.width / 1.3, y: size.height / 1.35)
                addChild(light)
                
                isLightDeleted = true
            }
        }
    }
    
    func updateArrowRotation(to touchLocation: CGPoint) {
        let dx = touchLocation.x - arrow.position.x
        let dy = touchLocation.y - arrow.position.y
        var angle = atan2(dy, dx) + .pi / 2
        
        let minAngle: CGFloat = 270 * (.pi / 180)
        let maxAngle: CGFloat = 90 * (.pi / 180)
        if angle < minAngle && angle > maxAngle {
            angle = minAngle
        } else if angle > maxAngle && angle < minAngle {
            angle = maxAngle
        }
        
        arrow.zRotation = angle
    }
    
    func upBall(contact: SKPhysicsContact) {
        let isBallAndBorderCollision = (contact.bodyA.categoryBitMask == CBitMask.ball && contact.bodyB.categoryBitMask == CBitMask.border) ||
        (contact.bodyA.categoryBitMask == CBitMask.border && contact.bodyB.categoryBitMask == CBitMask.ball)
        
        if isBallAndBorderCollision {
            ball.physicsBody?.restitution = 0.0
            let ballPosition = ball.position.x
            let groundPosition = bottomBorder.position.x
            
            if ballPosition < groundPosition {
                moveBall(toDirection: .right)
            } else {
                moveBall(toDirection: .left)
            }
        }
        
    }
    
    func contactWith(contact: SKPhysicsContact) {
        if (contact.bodyA.categoryBitMask == CBitMask.ball && contact.bodyB.categoryBitMask == CBitMask.obstacle) ||
            (contact.bodyA.categoryBitMask == CBitMask.obstacle && contact.bodyB.categoryBitMask == CBitMask.ball) {
            
            game?.currentScore += 1
            let handLayerNode = (contact.bodyA.node?.name == "obstacle") ? contact.bodyA.node : contact.bodyB.node
            
            if let handLayer = handLayerNode {
                if let numberNode = handLayer.childNode(withName: "numberNode") as? SKLabelNode {
                    if let numberText = numberNode.attributedText?.string {
                        if let number = Int(numberText) {
                            if number == 1 {
                                handLayer.removeFromParent()
                                
                                let replacementNode = SKSpriteNode(imageNamed: BallImageName.animationRemoveObstacle.rawValue)
                                replacementNode.size = CGSize(width: 50, height: 50)
                                replacementNode.position = handLayer.position
                                
                                addChild(replacementNode)
                                let fadeOutOriginal = SKAction.fadeOut(withDuration: 0.2)
                                
                                replacementNode.run(fadeOutOriginal) {
                                    replacementNode.removeFromParent()
                                }
                                
                            } else {
                                numberNode.attributedText = NSAttributedString(string: "\(number - 1)", attributes: [
                                    NSAttributedString.Key.font: UIFont(name: "BigshotOne-Regular", size: 24)!,
                                    NSAttributedString.Key.foregroundColor: UIColor.black,
                                    NSAttributedString.Key.strokeColor: UIColor.white,
                                    NSAttributedString.Key.strokeWidth: -1
                                ])
                            }
                        }
                    }
                }
            }
        }
    }
}
