do
  local modloader = remote.interfaces["modloader"]
  if modloader and modloader[script.mod_name] then
    return
  end
end

local cube_fx = require("__Ultracube__/scripts/cube_fx")
local cube_search = require("__Ultracube__/scripts/cube_search")
local cube_management = require("__Ultracube__/scripts/cube_management")
local entity_cache = require("__Ultracube__/scripts/entity_cache")
local tech_unlock = require("__Ultracube__/scripts/tech_unlock")
local transition = require("__Ultracube__/scripts/transition")

local function on_picker_dolly_moved(e)
  entity_cache.add(e.moved_entity, nil, e.start_pos)
  cube_search.remove_entity(e.entity)
  entity_cache.add(e.moved_entity)
end

local function on_load()
  entity_cache.on_load()
  cube_fx.on_load()
  cube_search.on_load()

  if remote.interfaces["PickerDollies"] and remote.interfaces["PickerDollies"]["dolly_moved_entity_id"] then
    script.on_event(remote.call("PickerDollies", "dolly_moved_entity_id"), on_picker_dolly_moved)
  end
end

local function on_init()
  -- Disable starting things.
  if remote.interfaces.freeplay then
    remote.call("freeplay", "set_disable_crashsite", true)
    remote.call("freeplay", "set_created_items", {
      ["cube-synthesizer"] = 1,
      ["cube-fabricator"] = 1,
      ["cube-construction-robot-0"] = 5,
    })
    remote.call("freeplay", "set_respawn_items", {})
  end

  entity_cache.refresh()
  cube_fx.refresh()
  cube_search.refresh()
  for _, force in pairs(game.forces) do
    tech_unlock.sync(force)
  end
  on_load()
end

local function on_player_created(e)
  local player = game.get_player(e.player_index)
  if not global.cube_given then
    global.cube_given = true
    player.insert(cube_management.cubes.ultradense)
  end

  local inventory = player.get_inventory(defines.inventory.character_armor)
  inventory.insert("cube-regulation-armor")
  local grid = inventory[1].grid
  grid.put {name = "cube-personal-roboport-equipment"}
  grid.put {name = "cube-battery-equipment"}
  grid.put {name = "cube-solar-panel-equipment"}
  grid.put {name = "cube-solar-panel-equipment"}
end

script.on_load(on_load)
script.on_init(on_init)
script.on_configuration_changed(on_init)

commands.add_command(
  "cube_refresh", nil,
  function()
    on_init()
    game.print("Refreshed data.")
  end)

script.on_event(defines.events.on_player_created, on_player_created)

script.on_event(
  {
    defines.events.on_player_main_inventory_changed,
    defines.events.on_player_trash_inventory_changed,
    defines.events.on_player_cancelled_crafting,
    defines.events.on_player_crafted_item,
    defines.events.on_player_cursor_stack_changed,
    defines.events.on_pre_player_crafted_item,
  },
  function(e)
    cube_management.update_player(e.player_index)
  end)

script.on_event(
  {
    defines.events.on_player_dropped_item,
    defines.events.on_player_fast_transferred,
  },
  function(e)
    cube_management.update_player(e.player_index)
    cube_search.hint_entity(e.entity)
  end)

script.on_event(
  {
    defines.events.on_pre_player_left_game,
  },
  function(e)
    cube_management.drop_before_leaving(e.player_index)
  end)

-- TODO: does fast replace leave broken entries in cache?
script.on_event(
  {
    defines.events.on_built_entity,
    defines.events.on_robot_built_entity,
  },
  function(e)
    if not e.created_entity.unit_number then
      return
    end
    entity_cache.add(e.created_entity)
  end)

script.on_event(
  defines.events.on_entity_died,
  function(e)
    if not e.entity.unit_number then
      return
    end
    cube_management.return_cube_fuel(e.entity, e.loot)
    entity_cache.remove(e.entity)
    cube_search.remove_entity(e.entity)
  end)

script.on_event(
  defines.events.script_raised_built,
  function(e)
    if not e.entity.unit_number then
      return
    end
    entity_cache.add(e.entity)
  end)

script.on_event(
  defines.events.script_raised_destroy,
  function(e)
    if not e.entity.unit_number then
      return
    end
    entity_cache.remove(e.entity)
    cube_search.remove_entity(e.entity)
  end)

script.on_event(
  defines.events.script_raised_teleported,
  function(e)
    if not e.entity.unit_number then
      return
    end
    entity_cache.remove(e.entity, e.old_surface_index, e.old_position)
    cube_search.remove_entity(e.entity)
    entity_cache.add(e.entity)
  end)

script.on_event(
  {
    defines.events.on_player_mined_entity,
    defines.events.on_robot_mined_entity,
  },
  function(e)
    if not e.entity.unit_number then
      return
    end
    cube_management.return_cube_fuel(e.entity, e.buffer)
    entity_cache.remove(e.entity)
    cube_search.remove_entity(e.entity)
  end)

script.on_event(
  {
    defines.events.on_surface_cleared,
    defines.events.on_surface_deleted,
  },
  function(e)
    entity_cache.refresh()
  end)

script.on_event(
  defines.events.on_research_finished,
  function(e)
    tech_unlock.trigger(e.research.force, e.research.name, true)
  end)

script.on_event(defines.events.on_tick,
  function(e)
    cube_fx.tick(e.tick)
    transition.tick(e.tick)
  end)