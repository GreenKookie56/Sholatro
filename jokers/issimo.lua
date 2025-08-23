SMODS.Joker{ --Issimo
    key = "issimo",
    config = {
        extra = {
            dollars = 1721,
            ante_value = 8
        }
    },
    loc_txt = {
        ['name'] = 'Issimo',
        ['text'] = {
            [1] = 'Earn {C:gold}$1721{}, then{C:red} +8{} Antes when bought'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  and not context.blueprint then
                return {
                    dollars = card.ability.extra.dollars,
                    extra = {
                        func = function()
                    local mod = card.ability.extra.ante_value
		ease_ante(mod)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
				return true
			end,
		}))
                    return true
                end,
                            message = "Ante +" .. card.ability.extra.ante_value,
                        colour = G.C.FILTER
                        }
                }
        end
    end
}