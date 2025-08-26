SMODS.Joker{ --v18 strategies
    key = "brickell",
    config = {
        extra = {
            Mult = 1,
            increasement = 2,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'v18 strategies',
        ['text'] = {
            [1] = '{X:red,C:white}X#2#{} Mult every {C:attention}reroll{}',
            [2] = 'Create a {C:attention}Ground Zero{}',
            [3] = 'when {C:attention}blind{} is selected',
            [4] = '{C:inactive}(Currently {}{X:red,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 12,
    rarity = "sholatro_the_pro",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Mult, card.ability.extra.increasement}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.Mult
                }
        end
        if context.reroll_shop  then
                return {
                    func = function()
                    card.ability.extra.Mult = (card.ability.extra.Mult) + card.ability.extra.increasement
                    return true
                end,
                    message = "Upgrade!"
                }
        end
        if context.setting_blind  then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sholatro_groundzero' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end
                }
        end
    end
}