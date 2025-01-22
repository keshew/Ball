import SwiftUI
import SpriteKit

class BallGameSpriteKit: SKScene, SKPhysicsContactDelegate {
    var game: BallGameData?
    var time: SKLabelNode!
    var scoreLabel: SKLabelNode!
    var timer: Timer?
    var scoreTimer: Timer?
    var ball: SKSpriteNode!
    var straightLine: SKSpriteNode!
    var straightLine2: SKSpriteNode!
    var hasContactOccurred = false
    var bottomBorder: SKSpriteNode!
    var arrow: SKSpriteNode!
    var isArrowVisible = false
    var isWeaponOpacity = false
    var isRocketOpacity = false
    var isLightDeleted = false
    var isSoundOff = false
    var isMusicOff = false
    var weapon: SKSpriteNode!
    var obstacle: SKNode!
    var linePunctir: SKSpriteNode!
    var linePunctir2: SKSpriteNode!
    var countOfMyMoney: SKLabelNode!
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        size = UIScreen.main.bounds.size
        setupView()
        startTimer()
        startScoreTimer()
    }
    
    override func update(_ currentTime: TimeInterval) {
        isIntrejectLine()
        isBallOutside()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            let node = atPoint(touchLocation)
            let lowerBound: CGFloat = size.height / 1.4
            let upperBound: CGFloat = size.height / 1.21
            
            if ball.position.y >= lowerBound && ball.position.y <= upperBound {
                arrow.isHidden = false
                isArrowVisible = true
                updateArrowRotation(to: touchLocation)
            }
            
            increaseSpeed(node: node)
            useWeapon(node: node)
            useRocket(node: node)
            removeObstacleWithWeapon(node: node)
            pauseGame(node: node)
            pauseOff(node: node)
            resetScene(node: node)
            goToMenu(node: node)
            toggleSound(node: node)
            toggleMusic(node: node)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isArrowVisible, let touch = touches.first {
            let touchLocation = touch.location(in: self)
            updateArrowRotation(to: touchLocation)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            moveNodeTo(location: touchLocation)
        }
        
        if isArrowVisible {
            arrow.isHidden = true
            isArrowVisible = false
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        upBall(contact: contact)
        contactWith(contact: contact)
    }
}
