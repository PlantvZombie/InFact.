extends RigidBody2D

var tween
var mouseOn = false
var mouseDist

func _process(delta):
	if Input.is_action_pressed("mclick"):
		set_freeze_enabled(true)
		tween = create_tween()
		tween.tween_property(self, "position", get_global_mouse_position(), 0.1)
		set_freeze_enabled(false)
	if Input.is_action_pressed("rclick") and mouseOn:
		set_freeze_enabled(true)
		tween = create_tween()
		tween.tween_property(self, "position", get_global_mouse_position(), 0.000001)
		set_freeze_enabled(false)
	if Input.is_action_just_released("rclick") and mouseOn:
		mouseOn = false
		mouseDist = Vector2(get_global_mouse_position().x - position.x, get_global_mouse_position().y - position.y)
		set_linear_velocity(Vector2(mouseDist.x * 10, mouseDist.y * 10))
		mouseOn = false
	if Input.is_action_just_released("launch"):
		mouseDist = Vector2(get_global_mouse_position().x - position.x, get_global_mouse_position().y - position.y)
		set_linear_velocity(Vector2(mouseDist.x * 5, mouseDist.y * 5))
	if global_position.x > 1360:
		global_position.x = 0
	if global_position.x < 0:
		global_position.x = 1360

func _on_mouse_entered():
	mouseOn = true
