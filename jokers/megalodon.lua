SMODS.Joker{ --Megalodon (v46-48)
    key = "megalodon",
    config = {
        extra = {
            mult = 700
        }
    },
    loc_txt = {
        ['name'] = 'Megalodon (v46-48)',
        ['text'] = {
            [1] = 'All {C:attention}played cards{} give {C:red}+#1#{} Mult when {C:attention}scored{}',
            [2] = 'and are {C:red}destroyed{} afterwards',
            [3] = '{C:inactive}Art by 1.2m^2 Fungus Room{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = "sholatro_the_pro",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
                context.other_card.should_destroy = true
                return {
                    mult = card.ability.extra.mult,
                    extra = {
                        message = "Thrash!",
                        colour = G.C.RED
                        }
                }
        end
    end
}