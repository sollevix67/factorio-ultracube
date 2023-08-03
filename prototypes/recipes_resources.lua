data:extend({
  {
    type = "recipe",
    name = "cube-stone-brick",
    category = "cube-furnace",
    energy_required = 3,
    ingredients = {{"stone", 4}},
    results = {{"stone-brick", 2}},
    always_show_made_in = true,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-glass",
    category = "cube-furnace",
    energy_required = 4,
    ingredients = {{"cube-sand", 8}},
    results = {{"cube-glass", 1}},
    always_show_made_in = true,
    enabled = false,
  },

  {
    type = "recipe",
    name = "cube-rare-metals",
    icon = "__Krastorio2Assets__/icons/items-with-variations/rare-metals/rare-metals.png",
    icon_size = 64, icon_mipmaps = 4,
    ingredients = {{"cube-raw-rare-metals", 500}},
    results = {{"cube-rare-metals", 250}},
    main_product = "",
    energy_required = 4,
    category = "cube-ultradense-furnace",
    subgroup = "cube-smelting",
    order = "0[0-rare-metal-smelting]",
    always_show_made_in = true,
    always_show_products = true,
    show_amount_in_title = false,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-explosive-rare-metals",
    icons = {
      {
        icon = "__Krastorio2Assets__/icons/items-with-variations/rare-metals/rare-metals.png",
        icon_size = 64, icon_mipmaps = 4,
      },
      {
        icon = "__base__/graphics/icons/explosives.png",
        icon_size = 64, icon_mipmaps = 4,
        scale = 0.25, shift = {8, -8},
      },
    },
    ingredients = {
      {"cube-raw-rare-metals", 6000},
      {"explosives", 16},
    },
    results = {{"cube-rare-metals", 2000}},
    main_product = "",
    energy_required = 4,
    category = "cube-ultradense-furnace",
    subgroup = "cube-smelting",
    order = "0[1-explosive-rate-metal-smelting]",
    always_show_made_in = true,
    always_show_products = true,
    show_amount_in_title = false,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-refined-rare-metals",
    icons = {
      {
        icon = "__Krastorio2Assets__/icons/items-with-variations/rare-metals/rare-metals.png",
        icon_size = 64, icon_mipmaps = 4,
      },
      {
        icon = "__Krastorio2Assets__/icons/items-with-variations/enriched-rare-metals/enriched-rare-metals.png",
        icon_size = 64, icon_mipmaps = 4,
        scale = 0.25, shift = {8, -8},
      },
    },
    ingredients = {{"cube-refined-rare-metals", 1000}},
    results = {{"cube-rare-metals", 1000}},
    main_product = "",
    energy_required = 4,
    category = "cube-ultradense-furnace",
    subgroup = "cube-smelting",
    order = "0[2-refined-rate-metal-smelting]",
    always_show_made_in = true,
    always_show_products = true,
    show_amount_in_title = false,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-rare-metal-crushing",
    icon = "__Krastorio2Assets__/icons/items-with-variations/enriched-rare-metals/enriched-rare-metals.png",
    icon_size = 64, icon_mipmaps = 4,
    ingredients = {{"cube-raw-rare-metals", 40}},
    results = {
      {type = "item", name = "cube-refined-rare-metals", amount_min = 15, amount_max = 20},
      {type = "item", name = "cube-calcium", amount_min = 0, amount_max = 10},
      {type = "item", name = "stone", amount_min = 0, amount_max = 5},
    },
    energy_required = 4,
    category = "cube-crusher",
    subgroup = "cube-processing",
    order = "a[rare-metal-crushing]",
    always_show_made_in = true,
    always_show_products = true,
    show_amount_in_title = false,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-stone-crushing",
    ingredients = {{"stone", 8}},
    results = {{"cube-sand", 16}},
    energy_required = 4,
    category = "cube-crusher",
    subgroup = "cube-processing",
    order = "c[stone-crushing]",
    always_show_made_in = true,
    always_show_products = true,
    show_amount_in_title = false,
    allow_decomposition = true,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-deep-core-crushing",
    icon = "__Krastorio2Assets__/icons/items-with-variations/imersite-powder/imersite-powder.png",
    icon_size = 64, icon_mipmaps = 4,
    ingredients = {{"cube-deep-core-ore", 40}},
    results = {
      {type = "item", name = "cube-deep-powder", amount_min = 30, amount_max = 60},
      {type = "item", name = "coal", amount_min = 20, amount_max = 40},
      {type = "item", name = "stone", amount_min = 0, amount_max = 10},
    },
    energy_required = 8,
    category = "cube-crusher",
    subgroup = "cube-processing",
    order = "d[deep-core-crushing]",
    always_show_made_in = true,
    always_show_products = true,
    show_amount_in_title = false,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-sand-dilution",
    icons = {
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Ultracube__/graphics/sand-01.png",
      },
      {
        icon_size = 64, icon_mipmaps = 4,
        icon = "__Krastorio2Assets__/icons/fluids/water.png",
        scale = 0.3125, shift = {0, -4},
      },
    },
    ingredients = {
      {type = "fluid", name = "water", amount = 200, catalyst_amount = 200},
      {"cube-sand", 4},
    },
    results = {{type = "fluid", name = "water", amount = 240, catalyst_amount = 200}},
    energy_required = 4,
    category = "cube-chemical-plant",
    subgroup = "cube-experimental",
    order = "0[sand-recycling]",
    main_product = "",
    always_show_made_in = true,
    always_show_products = true,
    show_amount_in_title = false,
    allow_decomposition = false,
    enabled = false,
    crafting_machine_tint = {
      primary = {r = 0.35, g = 0.525, b = 0.65},
      secondary = {r = 0.4, g = 0.5, b = 0.525},
      tertiary = {r = 0.4, g = 0.35, b = 0.3, a = 0.65},
      quaternary = {r = 0.2, g = 0.175, b = 0.15, a = 0.65},
    },
  },

  {
    type = "recipe",
    name = "cube-greenhouse-wood",
    icon = "__base__/graphics/icons/wood.png",
    icon_size = 64, icon_mipmaps = 4,
    ingredients = {
      {type = "fluid", name = "water", amount = 400},
    },
    results = {{"wood", 60}},
    energy_required = 60,
    main_product = "",
    category = "cube-greenhouse",
    subgroup = "cube-fuel",
    order = "0[wood]",
    always_show_made_in = true,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-greenhouse-potato",
    icon = "__Krastorio2Assets__/icons/items/potato.png",
    icon_size = 64, icon_mipmaps = 4,
    ingredients = {
      {type = "fluid", name = "water", amount = 400},
    },
    results = {{"cube-potato", 200}},
    energy_required = 60,
    main_product = "",
    category = "cube-greenhouse",
    subgroup = "cube-fuel",
    order = "1[potato]",
    always_show_made_in = true,
    allow_decomposition = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "cube-mash",
    ingredients = {{"cube-potato", 20}},
    results = {{"cube-mash", 8}},
    energy_required = 4,
    category = "cube-crusher",
    subgroup = "cube-processing",
    order = "b[mash]",
    always_show_made_in = true,
    always_show_products = true,
    show_amount_in_title = false,
    allow_decomposition = true,
    enabled = false,
  },
})
