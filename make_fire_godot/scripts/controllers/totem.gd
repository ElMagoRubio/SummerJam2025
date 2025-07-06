extends Node2D

@onready var light_1 = $LightLvl4/LightLvl3/LightLvl2/LightLvl1
@onready var light_2 = $LightLvl4/LightLvl3/LightLvl2
@onready var light_3 = $LightLvl4/LightLvl3
@onready var light_4 = $LightLvl4
@onready var button = $Button

@onready var level = 4

func _process(delta) -> void:
	if (level == 0):
		light_4.visible = false
	elif (level == 1):
		light_4.visible = true
		light_3.visible = false
	elif (level == 2):
		light_4.visible = true
		light_3.visible = true
		light_2.visible = false
	elif (level == 3):
		light_4.visible = true
		light_3.visible = true
		light_2.visible = true
		light_1.visible = false
	elif (level == 4):
		light_4.visible = true
		light_3.visible = true
		light_2.visible = true
		light_1.visible = true


func _on_button_pressed() -> void:
	print("Pulsado. Nivel ", level)
	level = (level + 1) % 5
