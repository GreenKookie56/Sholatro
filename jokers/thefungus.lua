SMODS.Joker{ --The Fungus
    key = "thefungus",
    config = {
        extra = 1
    },
    loc_txt = {
        ['name'] = 'The Fungus',
        ['text'] = {
            [1] = 'Destroy a random {C:attention}Joker{} when {C:attention}Blind{} is selected',
            [2] = 'and add {C:attention}twice{} the Joker\'s {C:attention}sell value{} to {X:dark_edition,C:white}operator{}',
            [3] = '(Currently {X:dark_edition,C:white}#1##2##3#5{} Chips)',
            [4] = '{s:0.8,C:inactive}wait this is NOT the expert{}',
            [5] = '{C:inactive}Art by 1.2m^2 Fungus Room{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 50,
    rarity = "sholatro_the_expert",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    loc_vars = function(self, q, card)
        return {
            vars = {
                "{",
                card.ability.extra,
                "}",
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
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
                    local sell_value_gain = joker_sell_value * 2
                    card.ability.extra = card.ability.extra + sell_value_gain
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
          if to_big(card.ability.extra) < to_big(2) then
            return {
                echips = 5
            }
          else
            return {
                hyperchips = {
                  math.floor(to_big(card.ability.extra)),
                  5
                }
             }
           end
        end
    end
}