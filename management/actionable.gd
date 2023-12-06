extends Area2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

##importando a cena do balloon para carregar o formato do dialogo
const Balloon = preload("res://dialogue/small_balloon.tscn") 


##funcao para mostrar o balao quando o actionable for ativado

func action() -> void:
	var balloon: Node = Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialogue_resource, dialogue_start)
