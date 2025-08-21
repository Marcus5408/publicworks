extends Camera3D

var speed := 5.0

func _process(delta: float) -> void:
    var direction := Vector3.ZERO
    if Input.is_action_pressed("ui_up"):
        direction.y += 1
    if Input.is_action_pressed("ui_down"):
        direction.y -= 1
    if Input.is_action_pressed("ui_left"):
        direction.x -= 1
    if Input.is_action_pressed("ui_right"):
        direction.x += 1

    if direction != Vector3.ZERO:
        direction = direction.normalized()
        translate(direction * speed * delta)
