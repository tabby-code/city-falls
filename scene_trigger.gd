class_name Scene_Trigger 

extends Area2D

@export var connected: String
var scene_folder = "res://scenes/"

func _on_area_entered(area: Area2D):
	var fp = scene_folder + connected + ".tscnch"
	var scene_tree = get_tree()
	scene_tree.change_scene_to_file(fp)
