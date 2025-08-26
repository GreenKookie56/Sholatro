SMODS.Joker{ --Orca (v36.0-36.1)
    key = "orca",
    config = {
        extra = {
            patch = 1,
            mult = 18.75,
            dead = 0,
            odds = 36
        }
    },
    loc_txt = {
        ['name'] = 'Orca (v36.0-36.1)',
        ['text'] = {
            [1] = '{X:red,C:white}X#2#{} Mult',
            [2] = '{C:green}#4# in #5#{} chance to set to {X:red,C:white}X#1#{} Mult',
            [3] = 'when a {C:attention}played card{} is {C:attention}scored{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sholatro_orca') 
        return {vars = {card.ability.extra.patch, card.ability.extra.mult, card.ability.extra.dead, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.mult
                }
        end
        if context.individual and context.cardarea == G.play  then
            if (card.ability.extra.dead or 0) == 0 then
                if SMODS.pseudorandom_probability(card, 'group_0_c10bcebc', 1, card.ability.extra.odds, 'j_sholatro_orca') then
                      card.ability.extra.dead = 1
                        card.ability.extra.mult = card.ability.extra.patch
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Patched!", colour = G.C.BLUE})
                  end
            end
        end
    end
}