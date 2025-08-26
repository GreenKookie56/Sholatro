SMODS.Joker{ --Vrejdilum
    key = "vrejdilum",
    config = {
        extra = {
            chips = 7440
        }
    },
    loc_txt = {
        ['name'] = 'Vrejdilum',
        ['text'] = {
            [1] = 'This Joker gives {C:blue}+10{} Chips',
            [2] = 'for every message',
            [3] = 'that contains \"{C:attention}vrej{}\" in',
            [4] = '{C:attention}Puddles of Pudding{} server',
            [5] = '{C:inactive}latest update: August 24th 2025{}',
            [6] = '(Currently {C:blue}+7440{} Chips)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 4
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

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.chips
                }
        end
    end
}