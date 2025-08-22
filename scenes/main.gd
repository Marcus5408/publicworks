extends Node3D

const game_data = preload("game_data.gd")
const levels: Dictionary = game_data.levels
const GameState = game_data.GameState

@export var builder: Node3D
@export var game_state: GameState = GameState.MAIN_MENU


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    game_state = GameState.MAIN_MENU


func load_level(stage_id: int, level_id: int) -> void:
    if levels.has(stage_id) and levels[stage_id].has(level_id):
        var level_data = levels[stage_id][level_id]
        builder.action_load(level_data.map)
        # Load the level scene here
    else:
        print("Level not found")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

    pass


func _replace_builder_tileset(new_structures: Array[Structure]) -> void:
    if new_structures.size() > 0:
        builder.structures = new_structures
    else:
        builder.structures = []
        print_debug("No structures passed in, zeroing builder structures")
