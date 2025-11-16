extends Node

var spawn_door: String = ""

signal spawn_player(position: Vector2, direction: String)

var scenes = {
	"Airport": preload("res://Airport.tscn"),
	"hairport": preload("res://hairport.tscn"),
	"duolingo_scene_2": preload("res://duolingo_scene_2.tscn"),
	"Athena": preload("res://Athena.tscn"),
	"parthenon": preload("res://parthenon.tscn"),
	"gallery_one": preload("res://gallery_one.tscn")
	# Add your other scenes here
}

func go_to_level(level_name: String, door_name: String) -> void:
	spawn_door = door_name

	if scenes.has(level_name):
		var scene = scenes[level_name]
		get_tree().change_scene_to_packed(scene)
	else:
		print("Scene not found: ", level_name)

func emit_spawn(position: Vector2, direction: String) -> void:
	emit_signal("spawn_player", position, direction)
