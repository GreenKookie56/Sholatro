-- arrow format stolen from entropy
function FormatArrowMult(arrows, mult)
    mult = number_format(mult)
    if to_big(arrows) < to_big(-1) then 
        return "="..mult 
    elseif to_big(arrows) < to_big(0) then 
        return "+"..mult 
    elseif to_big(arrows) < to_big(6) then 
        if to_big(arrows) < to_big(1) then
            return "X"..mult
        end
        local arr = ""
        for i = 1, to_big(arrows):to_number() do
            arr = arr.."^"
        end
        return arr..mult
    else
        return "{"..arrows.."}"..mult
    end
end

SMODS.Joker{ --The Fungus
    key = "thefungus",
    config = {
        extra = {
            operator = -1
        }
    },
    loc_txt = {
        ['name'] = 'The Fungus',
        ['text'] = {
            [1] = 'Destroy a random {C:attention}Joker{} when {C:attention}Blind{} is selected',
            [2] = 'and add the Joker\'s {C:attention}sell value{} to {X:dark_edition,C:white}operator{}',
            [3] = '(Currently {X:dark_edition,C:white}#1#{} Chips)',
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
                {FormatArrowMult(card.ability.extra.operator, 5)
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
                    local sell_value_gain = joker_sell_value
                    card.ability.extra.operator = card.ability.extra.operator + sell_value_gain
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
        if context.cardarea == G.jokers and context.joker_main or context.forcetrigger then
			if to_big(card.ability.extra.operator) <= to_big(-1) then
				return {
					chips = 5
				}
			elseif to_big(card.ability.extra.operator) == to_big(0) then
				return {
                    x_chips = 5
				}
			elseif to_big(card.ability.extra.operator) == to_big(1) then
				return {
					echips = 5
				}
			elseif to_big(card.ability.extra.operator) == to_big(2) then
				return {
					eechips = 5
				}
			elseif to_big(card.ability.extra.operator) >= to_big(3) then
				return {
					hyperchips = {
						lenient_bignum(card.ability.extra.operator),
						5
					}
				}
			end
        end
    end
}
