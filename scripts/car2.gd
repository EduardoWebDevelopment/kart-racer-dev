extends VehicleBody3D

var max_rpm = 1000
var max_torque = 200

func _physics_process(delta: float) -> void:
	steering = lerp(steering, Input.get_axis("right", "left") * 0.4, 5 * delta)
	var acceleration = Input.get_axis("backward", "forward")
	var rpm = $BackLeftWheel.get_rpm()
	$BackLeftWheel.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
	rpm = $BackRightWheel.get_rpm()
	$BackRightWheel.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
