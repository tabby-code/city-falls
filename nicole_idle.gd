class_name Player extends CharacterBody2D

@export var speed =400.0
const jump=-700.0
@export_range(0,1) var deceleration=0.1

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	SceneManager.connect("spawn_player", self._on_spawn_player)

func _on_spawn_player(spawn_position: Vector2, direction: String):
	global_position= spawn_position
	
	match direction:
		"up":
			$AnimatedSprite2D.play("nicole_idle")
			
func _physics_process(delta):
	if not is_on_floor():
		velocity.y+= gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y= jump
	
	var direction= Input.get_axis("left", "right")
	if direction:
		velocity.x=direction * speed
	else:
		velocity.x=move_toward(velocity.x, 0, speed)
	move_and_slide()
