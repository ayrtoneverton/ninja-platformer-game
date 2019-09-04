extends KinematicBody2D

const UP = Vector2(0, -1)

export var speedX = 20000
export var speedXInJump = 30000
export var jumpForce = 15000
export var jumpDown = 800
export var gravity = 400
export var maxJump = 4
export var KillEffectStep = 400
export var KillEffectEnd = 6000

var move = Vector2()
var jumps = 1
var KillEffect = 0

func _process(delta):
	if global.isKilled:
		KillEffect += 1
		if KillEffect >= (KillEffectEnd * delta):
			global.isKilled = false
			KillEffect = 0
			visible = true
		elif KillEffect % int(KillEffectStep * delta) == 0:
			visible = !visible
	
	if is_on_floor():
		if Input.is_action_pressed('ui_up'):
			jumps = 1
			move.y = -jumpForce * delta

		if Input.is_action_pressed('ui_right'):
			move.x = speedX * delta
			$AnimatedSprite.animation = 'run'
			$AnimatedSprite.flip_h = false
		elif Input.is_action_pressed('ui_left'):
			move.x = -speedX * delta
			$AnimatedSprite.animation = 'run'
			$AnimatedSprite.flip_h = true
		else:
			move.x = 0
			$AnimatedSprite.animation = 'idle'
	else:
		$AnimatedSprite.animation = 'jump'
		if jumps < maxJump && Input.is_action_just_pressed('ui_up'):
			jumps += 1
			move.y = -jumpForce * delta
		elif Input.is_action_pressed('ui_down'):
			move.y += jumpDown * delta
		else:
			move.y += gravity * delta

		if Input.is_action_pressed('ui_right'):
			move.x = speedXInJump * delta
			$AnimatedSprite.flip_h = false
		elif Input.is_action_pressed('ui_left'):
			move.x = -speedXInJump * delta
			$AnimatedSprite.flip_h = true
		else:
			move.x = 0

	move_and_slide(move, UP)
