extends CharacterBody2D

var _state_machine
var placa_in_range = false

@export_category("Variables")
@export var _move_speed: float = 200.0
@export var _friction: float = 0.2
@export var _acceleration: float = 0.1

@export_category("Objects")
@export var _animation_tree: AnimationTree = null
@onready var actionable_finder: Area2D = $Direction/ActionableFinder

##primeira função a ser executada no objeto
func _ready() -> void:
	_animation_tree.active = true
	_state_machine = _animation_tree["parameters/playback"]
	
func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return
	_move()
	_animate()
	move_and_slide()
	## ações para o personagem andar
func _move() -> void:
	var _direction: Vector2 = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	)
	
	if _direction != Vector2.ZERO:
		_animation_tree["parameters/idle/blend_position"] = _direction
		_animation_tree["parameters/walk/blend_position"] = _direction
		velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _acceleration)	
		velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _acceleration)	
		return 
		
	velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _friction)
	velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _friction)
	
	velocity = _direction.normalized() * _move_speed
	velocity = _direction.normalized() * _move_speed

func _animate() -> void:
	if velocity.length() > 1:
		_state_machine.travel("walk")
		return
	
	_state_machine.travel("idle")
	pass


func _on_actionable_finder_body_entered(body):
	if body.has_method("placa"):
		placa_in_range = true

func _on_actionable_finder_body_exited(body):
	if body.has_method("placa"):
		placa_in_range = false
