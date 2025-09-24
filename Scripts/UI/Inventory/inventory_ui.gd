extends CanvasLayer

@onready var grid_container = %GridContainer

@export var size: int = 8
@export var columns: int = 4

const INVENTORY_SLOT: PackedScene = preload("res://Scenes/UI/inventory_slot.tscn")


func _ready() -> void:
	grid_container.columns = columns
	
	for i in size:
		var inventory_slot: Node = INVENTORY_SLOT.instantiate()
		grid_container.add_child(inventory_slot)

func toggle():
	# toggle visibility
	visible = !visible
