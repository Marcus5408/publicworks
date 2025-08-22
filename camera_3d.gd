extends Camera3D


# parallax to camera
func _process(delta: float) -> void:
    var parallax_effect := Vector2(0.1, 0.1) # Adjust the parallax effect strength
    var offset := (Vector2(global_transform.origin.x, global_transform.origin.y) * parallax_effect) * delta
    global_transform.origin -= Vector3(offset.x, offset.y, 0)