SMODS.Joker{ --Ground Zero (pre v30)
    key = "groundzero",
    config = {
        extra = {
            Active = 1,
            chips = 700
        }
    },
    loc_txt = {
        ['name'] = 'Ground Zero (pre v30)',
        ['text'] = {
            [1] = '{C:red}+#2#{} Mult for the',
            [2] = '{C:attention}first hand{} of the round',
            [3] = '{s:0.8,C:inactive}ok what on earth is this{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Active, card.ability.extra.chips}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (card.ability.extra.Active or 0) == 1 then
                card.ability.extra.Active = 0
                return {
                    mult = card.ability.extra.chips
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    func = function()
                    card.ability.extra.Active = 1
                    return true
                end
                }
        end
    end
}