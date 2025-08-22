SMODS.Joker{ --Flagship plane
    key = "flagshipplane",
    config = {
        extra = {
            chip = 1.5,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Flagship plane',
        ['text'] = {
            [1] = 'Each played {C:clubs}Clubs{} has a',
            [2] = '{C:green}#2# in #3#{} chance to {X:blue,C:white}X#1#{} Chips',
            [3] = 'when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    cost = 5,
    rarity = "sholatro_subtower",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sholatro_flagshipplane') 
        return {vars = {card.ability.extra.chip, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Clubs") then
                if SMODS.pseudorandom_probability(card, 'group_0_9b599a9c', 1, card.ability.extra.odds, 'j_sholatro_flagshipplane') then
                      SMODS.calculate_effect({x_chips = card.ability.extra.chip}, card)
                  end
            end
        end
    end
}