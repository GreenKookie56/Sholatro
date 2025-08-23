SMODS.Joker{ --tb1 burny stuff
    key = "tb1burnystuff",
    config = {
        extra = {
            scoring = 1,
            cd = 4
        }
    },
    loc_txt = {
        ['name'] = 'tb1 burny stuff',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}X1{} Mult',
            [2] = 'after {C:attention}#2#{} played hands',
            [3] = 'that contain {C:attention}5{} scoring cards',
            [4] = '(Currently {X:red,C:white}X#1#{} Chips)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
        return {vars = {card.ability.extra.scoring, card.ability.extra.cd}}
    end,

    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            if (#context.scoring_hand >= 5 and (card.ability.extra.cd or 0) > 1) then
                return {
                    func = function()
                    card.ability.extra.cd = math.max(0, (card.ability.extra.cd) - 1)
                    return true
                end
                }
            elseif (#context.scoring_hand >= 5 and (card.ability.extra.cd or 0) <= 1) then
                return {
                    func = function()
                    card.ability.extra.scoring = (card.ability.extra.scoring) + 1
                    return true
                end,
                    message = "Upgrade!",
                    extra = {
                        func = function()
                    card.ability.extra.cd = 4
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.scoring
                }
        end
    end
}