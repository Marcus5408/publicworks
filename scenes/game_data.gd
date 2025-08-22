extends Resource
class_name game

enum GameState {
    MAIN_MENU,
    LEVEL_SELECT,
    LEVEL_PLAYING,
    LEVEL_PAUSED,
    LEVEL_RETRY,
    LEVEL_COMPLETE
}

# levels:
#   <stage_id>: {
#       <level_id>: { "name" (string): "<level_name>", "map" (string): "<map_path>", "loadout" (Array[Structure]): { } }
#   }
const levels: Dictionary = {
    1: {
        1: {
            "name": "Level 1-1",
            "map": "res://levels/level1-1.res",
            "loadout": ["res://structures/road_straight.tres"]
        },
        2: {
            "name": "Level 1-2",
            "map": "res://levels/level1-2.res",
            "loadout": ["res://structures/road_straight.tres", "res://structures/road_curve.tres"]
        },
        3: {
            "name": "Level 1-3",
            "map": "res://levels/level1-3.res",
            "loadout": ["res://structures/road_straight.tres", "res://structures/road_curve.tres", "res://structures/road-split.tres"]
        },
    }
}