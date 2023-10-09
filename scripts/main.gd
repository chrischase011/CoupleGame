extends Node2D

var is_panel_layer_opened = false

func _ready():
	pass


func _on_BackButton_pressed():
	is_panel_layer_opened = !is_panel_layer_opened
	
	if is_panel_layer_opened:
		$PanelLayer.visible = true


func _on_NoButton_pressed():
	is_panel_layer_opened = !is_panel_layer_opened
	
	if !is_panel_layer_opened:
		$PanelLayer.visible = false


func _on_YesButton_pressed():
	Global.scene = "res://scenes/startgame.tscn"
	get_tree().change_scene(Global.loading_scene)
