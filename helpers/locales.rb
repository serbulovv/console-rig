# frozen_string_literal: true

module Helpers
  module Locales
    CHOOSE_MENU_OPTION = 'Choose menu option'
    WRONG_MENU_OPTION_ERROR = 'Invalid menu option, please try again'

    ATTACK_RESULT = 'Attack for %{damage} damage (remaining hp: %{hp})'

    BATTLE_TITLE = 'Battle: Player vs %{enemy_name}'
    PLAYER_HP_LABEL = 'Player HP: %{hp}'
    ENEMY_HP_LABEL = '%{enemy_name} HP: %{hp}'

    VICTORY_MESSAGE = 'Victory!'
    DEFEAT_MESSAGE = 'Defeat...'

    BOSS_LABEL = '%{name} (BOSS)'
    BACK_OPTION_LABEL = 'Back'
    
    LOOT_RECEIVED = 'Received: %{item_name} x%{quantity}'
    INVENTORY_TITLE = 'Inventory'
    INVENTORY_EMPTY = 'Your inventory is empty'

    CRAFTING_TITLE = 'Craft an item'
    CRAFT_SUCCESS = 'Item crafted successfully!'
    CRAFT_UNKNOWN_RECIPE = 'Unknown recipe'
    CRAFT_MISSING_MATERIALS = 'Missing materials: %{items}'

    EQUIPMENT_TITLE = 'Equip an item'
    EQUIP_SUCCESS = 'Item equipped!'
  end
end