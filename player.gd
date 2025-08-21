extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
    var input_vector := Vector2(
        Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
        Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
    )

    if input_vector.length() > 0:
        input_vector = input_vector.normalized()
        # Isometric diagonal movement checks
        if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_right"):
            # Upright: isometric up-right
            var iso_vector := Vector2(1, -0.5).normalized()
            velocity.x = iso_vector.x * SPEED
            velocity.y = iso_vector.y * SPEED
        elif Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_left"):
            # Upleft: isometric up-left
            var iso_vector := Vector2(-1, -0.5).normalized()
            velocity.x = iso_vector.x * SPEED
            velocity.y = iso_vector.y * SPEED
        elif Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_right"):
            # Downright: isometric down-right
            var iso_vector := Vector2(1, 0.5).normalized()
            velocity.x = iso_vector.x * SPEED
            velocity.y = iso_vector.y * SPEED
        elif Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_left"):
            # Downleft: isometric down-left
            var iso_vector := Vector2(-1, 0.5).normalized()
            velocity.x = iso_vector.x * SPEED
            velocity.y = iso_vector.y * SPEED
        else:
            # Normal cardinal movement
            velocity.x = input_vector.x * SPEED
            velocity.y = input_vector.y * SPEED
    else:
        velocity = velocity.move_toward(Vector2.ZERO, SPEED)

    move_and_slide()
