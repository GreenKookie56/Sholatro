SMODS.Joker{ --Grilled chicken
    key = "grilledchicken",
    config = {
        extra = {
            grilledchicken = 1,
            no = 0
        }
    },
    loc_txt = {
        ['name'] = 'Grilled chicken',
        ['text'] = {
            [1] = 'Instead of buying {C:attention}Jokers{},',
            [2] = 'eat {C:attention}grilled chicken{}',
            [3] = '{C:inactive}(Currently {}{X:attention,C:white}#1#{}{C:inactive} Grilled Chicken){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.grilledchicken}}
    end,

    calculate = function(self, card, context)
        if context.buying_card  and not context.blueprint then
                return {
                    func = function()
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not joker.ability.eternal and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
                if target_joker then
                    local joker_sell_value = target_joker.sell_cost or 0
                    local sell_value_gain = joker_sell_value * 1
                    card.ability.extra.grilledchicken = card.ability.extra.grilledchicken + sell_value_gain
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
                    return true
                end
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.grilledchicken
                }
        end
    end
}