SMODS.Joker{ --tb1 faster firing
    key = "tb1fasterfiring",
    config = {
        extra = {
            scoring = 1
        }
    },
    loc_txt = {
        ['name'] = 'tb1 faster firing',
        ['text'] = {
            [1] = 'This Joker gains {X:blue,C:white}X0.2{} Chips',
            [2] = 'if played hand contains',
            [3] = '{C:attention}5{} scoring cards',
            [4] = '(Currently {X:blue,C:white}X#1#{} Chips)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.scoring}}
    end,

    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            if #context.scoring_hand >= 5 then
                return {
                    func = function()
                    card.ability.extra.scoring = (card.ability.extra.scoring) + 0.2
                    return true
                end,
                    message = "Upgrade!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = card.ability.extra.scoring
                }
        end
    end
}