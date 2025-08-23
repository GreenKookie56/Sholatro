SMODS.Joker{ --Bloon Exclusion Zone (v38+)
    key = "bez",
    config = {
        extra = {
            mult = 14
        }
    },
    loc_txt = {
        ['name'] = 'Bloon Exclusion Zone (v38+)',
        ['text'] = {
            [1] = 'Every scored {C:spades}Spades{}',
            [2] = 'permanently gains {C:red}+14{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Spades") then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}