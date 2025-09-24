extends Node
class_name Inventory

@onready var inventory_ui = $InventoryUI

# items currently in inventory
@export var items: Array[InventoryItem] = []

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Inventory"):
		inventory_ui.toggle()

func add_item(item: InventoryItem, stacks: int) -> void:
	if stacks && item.max_stacks > 1:
		add_stackable_item_to_inventory(item, stacks)
	else:
		items.append(item)
		# TODO: update player UI

func add_stackable_item_to_inventory(item: InventoryItem, stacks: int) -> void:
	# check if item is already in inventory (reverse search)
	var item_index: int = -1
	for i in items.size():
		if items[i] != null && items[i].name == item.name:
			item_index = i
	
	# if we found the item
	if item_index != -1:
		# add stacks to found item
		var inventory_item: InventoryItem = items[item_index]
		# check if we can add current stack to item in inventory
		if inventory_item.stacks + stacks <= item.max_stacks:
			inventory_item.stacks += stacks
			items[item_index] = inventory_item
			# TODO: update player UI
		else:
			var stacks_diff: int = inventory_item.stacks + stacks - item.max_stacks
			var additional_inventory_item: InventoryItem = inventory_item.duplicate(true)
			inventory_item.stacks = item.max_stacks
			# TODO: update player UI
			additional_inventory_item.stacks = stacks_diff
			items.append(additional_inventory_item)
			# TODO: update player UI
	else:
		item.stacks = stacks
		items.append(item)
		# TODO: update player UI
