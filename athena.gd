extends Node2D

func _ready():
	DialogueManager.show_example_dialogue_balloon(load("res://Athena.dialogue"), "start")
	if SceneManager.spawn_door != "":
		_spawn_player_at_door(SceneManager.spawn_door)

func _spawn_player_at_door(door_name: String):
	var door_path = "scene_trigger_" + door_name
	if has_node(door_path):
		var door = get_node(door_path)
		var spawn_position = door.spawn_marker.global_position
		var direction = door.spawn_direction
		SceneManager.emit_spawn(spawn_position, direction)
	else:
		print("Door not found: ", door_path)
