data:extend({
  {
    type = "technology",
    name = "cube-express-logistics",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/logistics-3.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-transport-belt-2"},
      {type = "unlock-recipe", recipe = "cube-underground-belt-2"},
      {type = "unlock-recipe", recipe = "cube-splitter-2"},
    },
    prerequisites = {
      "cube-abstract-interrogation-card",
      "cube-logistics",
      "cube-elbow-grease",
    },
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
        {"cube-abstract-interrogation-card", 1},
      },
      time = 30,
    },
    order = "2-0-0",
  },
  {
    type = "technology",
    name = "cube-electric-energy-distribution-2",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/electric-energy-distribution-2.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-substation"},
    },
    prerequisites = {
      "cube-abstract-interrogation-card",
      "cube-electric-energy-distribution-1",
    },
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
        {"cube-abstract-interrogation-card", 1},
      },
      time = 30,
    },
    order = "2-0-1",
  },
  {
    type = "technology",
    name = "cube-roboport",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/advanced-roboports.png",
    effects = {
      {type = "unlock-recipe", recipe = "cube-roboport"},
      {type = "unlock-recipe", recipe = "cube-logistic-chest-passive-provider"},
      {type = "unlock-recipe", recipe = "cube-logistic-chest-storage"},
    },
    prerequisites = {
      "cube-abstract-interrogation-card",
      "cube-personal-roboport-equipment",
    },
    unit = {
      count = 240,
      ingredients = {
        {"cube-basic-contemplation-unit", 1},
        {"cube-fundamental-comprehension-card", 1},
        {"cube-abstract-interrogation-card", 1},
      },
      time = 30,
    },
    order = "2-0-1",
  },
})