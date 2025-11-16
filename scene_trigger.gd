class_name scene_trigger 
extends Area2D

@export var connected_scene: String
@export var connected_exit: String
@export var spawn_direction: String
@onready var spawn_marker = $Spawn

func _on_body_entered(body):
	if body is Player:
		SceneManager.go_to_level(connected_scene, connected_exit)
