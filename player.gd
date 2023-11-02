extends CharacterBody2D
class_name Player

const SPEED = 90;

signal ateTreat


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$AnimatedSprite2D.flip_h = true
	else:
		velocity.x = 0
	
	
	if velocity.x != 0:
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")
	
	
	if is_on_floor():
		velocity.y = 1
	else:
		velocity.y += 420 * delta
	
	if Input.is_action_just_pressed("ui_up") && is_on_floor():
		velocity.y = -200
	
	move_and_slide()



func eat_treat():
	ateTreat.emit()
