extends Node2D

var crate

func _on_spawn_crate_pressed():
	crate = load("res://box.tscn").instantiate()
	add_child(crate)
	crate.position = Vector2(680, 10)

func _on_reset_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
