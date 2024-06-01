extends AnimatableBody2D

var tween
var onFloor = false
var gravity = 1
var onBox = false

func _physics_process(delta):
	if Input.is_action_pressed("click"):
		gravity = 1
		tween = create_tween()
		tween.tween_property(self, "position", get_global_mouse_position(), 0.1)
	else:
		if not onFloor and not onBox:
			position.y += gravity
			gravity += 0.05
		if onFloor:
			position.y = 573

func _on_area_2d_body_entered(body):
	if body.name == "Floor":
		onFloor = true
	if body.name == "Box":
		onBox = true

func _on_area_2d_body_exited(body):
	if body.name == "Floor":
		onFloor = false
	if body.name == "Box":
		onBox = false
