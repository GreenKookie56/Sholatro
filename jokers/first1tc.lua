SMODS.Joker{ --First 1tc (v25)
    key = "first1tc",
    config = {
        extra = {
            mult = 650
        }
    },
    loc_txt = {
        ['name'] = 'First 1tc (v25)',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult',
            [2] = 'if no other {C:attention}Jokers{} are present'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 19,
    rarity = "sholatro_the_pro",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if #G.jokers.cards == 1 then
                return {
                    Xmult = card.ability.extra.mult
                }
            end
        end
    end
}