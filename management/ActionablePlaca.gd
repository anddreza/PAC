extends Area2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

##funcao para mostrar o balao quando o actionable for ativado

func action() -> void:
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
