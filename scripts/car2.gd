extends VehicleBody3D

func _ready() -> void:
	$GameListener.visible = false
	$Ui.visible = true


var max_rpm = 2500
var max_torque = 500

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pass
		
#func pauseMenu():
	

#func _pause_check():
	## if pause button is pressed,
	#if Input.is_action_pressed("pause"):
		#
		## if pause menu visiblity is true,
		#if $GameListener.visible:
			#
			## unpause
			#$GameListener.visible = false
	#
	## if pause button is pressed,
	#if Input.is_action_pressed("pause"):
		#
		## if pause menu visiblity is false,
		#if !$GameListener.visible:
			#
			## 
			#$GameListener.visible = true

func _physics_process(delta: float) -> void:
	steering = lerp(steering, Input.get_axis("right", "left") * 0.4, 5 * delta)
	var acceleration = Input.get_axis("backward", "forward")
	var rpm = $BackLeftWheel.get_rpm()
	$BackLeftWheel.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
	rpm = $BackRightWheel.get_rpm()
	$BackRightWheel.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
	
	var velocity_x = (round(linear_velocity.x * 100) / 100 )
	var velocity_z = (round(linear_velocity.z * 100) / 100 )
	print(velocity_x + velocity_z)
	
	#_pause_input()
	
	
