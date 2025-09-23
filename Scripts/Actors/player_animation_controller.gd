extends AnimatedSprite2D

class_name AnimationController

const MOVEMENT_TO_IDLE = {
	"BackWalk": "BackIdle",
	"FrontWalk": "FrontIdle",
	"RightWalk": "RightIdle",
	"LeftWalk": "LeftIdle"
}

func play_movement_animation(velocity: Vector2):
	if velocity.x > 0:
		play("RightWalk")
	elif velocity.x < 0:
		play("LeftWalk")
	
	if velocity.y > 0:
		play("FrontWalk")
	elif velocity.y < 0:
		play("BackWalk")
	
	
func play_idle_animation():
	if MOVEMENT_TO_IDLE.keys().has(animation):
		play(MOVEMENT_TO_IDLE[animation])
