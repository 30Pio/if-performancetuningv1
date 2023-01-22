Config = {}

Config.ESX = true

Config.QBCORE = false

Config.Location = {
  {
  markerposition = vector3(-210.6, -1323.6, 30.8), -- Interact Position
  blipname = "tUNING", -- Blip Name
  blipsprite = 590, -- Blip 
  blipcolor = 0, -- Blip Color
  blipscale = 1.0, -- Blip Size
  dist = 2.5 -- distance to interact (let be normal)
  }
}

Config.Locales = {
  titlelocale = "WELCOME TO THE",
  descriptionlocale = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum condimentum elit sem, id cursus nunc faucibus id.",

  interactmessage = "Press E to Interact the Tuning Shop",

  buymessage = "You have successfully acquired the part.";
  nomessage = "you have too little money";
}

function Notification(message)

  TriggerEvent("notifications", "red", "TUNING", message)

end

Config.TunningTeile = {
    Motor = {
      [-1] = {
        price = "0",
        teil = "Standard",
      },
      [0] = {
        price = 4,
        teil = "Engine #1",
      },
      [1] = {
        price = 5,
        teil = "Engine #2",
      },
      [2] = {
        price = 6,
        teil = "Engine #3",
      },
      [3] = {
        price = 7,
        teil = "Engine #4",
      },
    },
    Brake = {
      [-1] = {
        price = "0",
        teil = "Standard",
      },
      [0] = {
        price = 4,
        teil = "Brake #1",
      },
      [1] = {
        price = 5,
        teil = "Brake #2",
      },
      [2] = {
        price = 6,
        teil = "Brake #3",
      },
      [3] = {
        price = 7,
        teil = "Brake #4",
      },
    },
    Suspension = {
      [-1] = {
        price = "0",
        teil = "Standard",
      },
      [0] = {
        price = 4,
        teil = "Suspension #1",
      },
      [1] = {
        price = 5,
        teil = "Suspension #2",
      },
      [2] = {
        price = 6,
        teil = "Suspension #3",
      },
      [3] = {
        price = 7,
        teil = "Suspension #4",
      },
      
  },
  
  Turbo = {
    [true] = {
      price = 4,
      teil = "Turbo On",
    },
    [false] = {
      price = 4,
      teil = "Turbo Off",
    },
    
},

Armour = {
  [-1] = {
    price = "0",
    teil = "Standard",
  },
  [0] = {
    price = 4,
    teil = "Armour #1",
  },
  [1] = {
    price = 5,
    teil = "Armour #2",
  },
  [2] = {
    price = 6,
    teil = "Armour #3",
  },
  [3] = {
    price = 7,
    teil = "Armour #4",
  },
  
},

Transmission = {
  [-1] = {
    price = "0",
    teil = "Standard",
  },
  [0] = {
    price = 4,
    teil = "Transmission #1",
  },
  [1] = {
    price = 5,
    teil = "Transmission #2",
  },
  [2] = {
    price = 6,
    teil = "Transmission #3",
  },
  [3] = {
    price = 7,
    teil = "Transmission #4",
  },
  
},
}