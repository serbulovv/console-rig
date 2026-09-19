# frozen_string_literal: true

require_relative 'helpers/locales'

require_relative 'modules/commands/command'
require_relative 'modules/commands/attack_command'

require_relative 'modules/strategies/combat_strategy'
require_relative 'modules/strategies/basic_attack_strategy'

require_relative 'models/enemy'
require_relative 'models/player'

require_relative 'modules/repositories/location_repository'
require_relative 'modules/repositories/monster_repository'
require_relative 'modules/repositories/item_repository'
require_relative 'modules/repositories/recipe_repository'

require_relative 'modules/battle/battle_process'

require_relative 'modules/states/menu_state'
require_relative 'modules/states/main_menu_state'
require_relative 'modules/states/dungeons_menu_state'
require_relative 'modules/states/location_state'
require_relative 'modules/states/fight_state'
require_relative 'modules/states/inventory_state'
require_relative 'modules/states/crafting_state'
require_relative 'modules/states/equipment_state'

require_relative 'modules/crafting/craft_item_form'

require_relative 'modules/equipment/equip_item_service'

require_relative 'modules/menu_context'

require_relative 'modules/loot/loot_resolver'

class App
  def call
    Modules::MenuContext.new(Modules::States::MainMenuState.new).run
  end
end

App.new.call