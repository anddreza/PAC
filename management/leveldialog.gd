extends Node2D
class_name leveldialog

const _DIALOG_SCREEN: PackedScene = preload("res://dialog/dialog.tscn")

var _dialog_data: Dictionary = {
	0:	{
		"faceset": "res://imgREADME/editar_goodfarm.png",
		"dialog": "Ola, bem vindo ao Good Farm",
		"title": "Pintinho"
	}
}

@export_category("Objects")
@export var _hud: CanvasLayer = null

func _process(_delta : float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_data
		_hud.add_child(_new_dialog)


