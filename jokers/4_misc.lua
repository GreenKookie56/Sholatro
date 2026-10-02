if Talisman then
SMODS.Joker{ --Ancient meme
    key = "ancientmeme",
    config = {
    },
    loc_txt = {
        ['name'] = 'Ancient meme',
        ['text'] = {
            [1] = '{X:money,C:dark_edition}=$939{} when {C:green}shop{} is {C:attention}rerolled{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 30,
    rarity = "sholatro_the_expert",
    blueprint_compat = false,
    demicoloncompat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.reroll_shop or context.forcetrigger then
                return {
                    func = function()
                    local target_amount = 939
                    local current_amount = G.GAME.dollars
                    local difference = target_amount - current_amount
                    ease_dollars(difference)
                    return true
                end
                }
        end
    end
}
end
SMODS.Joker{ --Horseboard
    key = "horseboard",
    config = {
	    extra = {
			mult = 1	
		}
    },
    loc_txt = {
        ['name'] = 'Horseboard',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult',
            [2] = 'for every {C:attention}horse react{} in',
            [3] = '{C:dark_edition}Bloonlatro horseboard{}',
            [4] = '(in sholatro-ideas, Bloonlatro server)',
            [5] = '{C:inactive}(Currently{} {X:red,C:white}X#2#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    demicoloncompat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult, 9 * card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    Xmult = lenient_bignum(card.ability.extra.mult * 9)
                }
        end
        if context.forcetrigger then
                return {
                    Xmult = lenient_bignum(card.ability.extra.mult * 9)
                }
        end
    end
}
SMODS.Joker{ --Ploone
    key = "ploone",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Ploone',
        ['text'] = {
            [1] = 'Create a {C:dark_edition}Negative{} {C:attention}Lucky Cat{}',
            [2] = 'at the end of {C:attention}shop{}',
            [3] = '{C:inactive}Art & Design by Ic1clez_{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    demicoloncompat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.ending_shop or context.forcetrigger then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_lucky_cat' })
                    if joker_card then
                        joker_card:set_edition("e_negative", true)
                        
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

SMODS.Joker{ --Red Sauda
    key = "redsauda",
    loc_txt = {
        ['name'] = 'Red Sauda (v46+)',
        ['text'] = {
            [1] = 'Swap {C:blue}Chips{} and {C:red}Mult{}',
            [2] = 'before hand starts scoring',
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    demicoloncompat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if context.initial_scoring_step or context.forcetrigger then
            return {
                swap = true
            }
        end
    end
}


SMODS.Joker{ --Sheppi
    key = "sheppi",
    config = {
        extra = {
            chips = 1,
            chipscale = 0.02
        }
    },
    loc_txt = {
        ['name'] = 'Sheppi',
        ['text'] = {
            [1] = 'When a {C:hearts}Heart{} is played and scored,',
            [2] = '{X:blue,C:white}X#1#{} Chips and increase this by {X:blue,C:white}#2#{}',
            [3] = '{C:inactive}Art & Design by Ic1clez_{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips, card.ability.extra.chipscale}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Hearts") then
                local chips_value = card.ability.extra.chips
                card.ability.extra.chips = (card.ability.extra.chips) + card.ability.extra.chipscale
                return {
                    x_chips = chips_value,
                    extra = {
                        message = "Upgrade!",
                        colour = G.C.GREEN
                        }
                }
            end
        end
    end
}
SMODS.Joker{ --Shiniest award (v38)
    key = "shiniestaward",
    config = {
        extra = {
            req = 38,
            played = 0
        }
    },
    loc_txt = {
        ['name'] = 'Shiniest award (v38)',
        ['text'] = {
            [1] = '{C:red}+2,000,000{} Mult only',
            [2] = 'after playing {C:attention}#1#{} hands',
            [3] = '{C:inactive}(#2#/#1#){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    demicoloncompat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.req, card.ability.extra.played}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (card.ability.extra.played or 0) >= card.ability.extra.req then
                return {
                    mult = 2000000
                }
            else
                card.ability.extra.played = (card.ability.extra.played) + 1
                return {
                    message = "Update!"
                }
            end
        end
        if context.forcetrigger then
            return {
                mult = 2000000
            }
        end
    end
}

SMODS.Joker{ --Grilled chicken
    key = "grilledchicken",
    config = {
        extra = {
            chicken = 0,
        }
    },
    loc_txt = {
        ['name'] = 'Grilled chicken',
        ['text'] = {
            [1] = 'Instead of owning stuff,',
            [2] = 'eat {C:attention}grilled chicken{}',
            [3] = '{C:inactive}(Currently {}{X:attention,C:white}#1#{}{C:inactive} Grilled Chicken){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chicken}}
    end,

    calculate = function(self, card, context)
        if context.selling_card  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.chicken = (card.ability.extra.chicken) + 1
                    return true
                end,
                message = '+1 Grilled Chicken',
            }
        end
        if context.cardarea == G.jokers and context.joker_main or context.forcetrigger then
            return {
                Xmult = 1 + 0.1 * card.ability.extra.chicken
            }
        end
    end
}

SMODS.Joker{ --Vrejdilum
    key = "vrejdilum",
    config = {
    },
    loc_txt = {
        ['name'] = 'Vrejdilum',
        ['text'] = {
            [1] = 'This Joker gives {C:blue}+1{} Chips',
            [2] = 'for every message',
            [3] = 'that contains \"{C:attention}vrej{}\" in',
            [4] = '{C:attention}Puddles of Pudding{} server',
            [5] = '{C:inactive}latest update: Oct 2 2026{}',
            [6] = '{C:inactive}(Currently{} {C:blue}+781{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 16,
    rarity = 3,
    blueprint_compat = true,
    demicoloncompat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rif' and args.source ~= 'rta' and args.source ~= 'sou' and args.source ~= 'uta' and args.source ~= 'wra' 
          or args.source == 'sho'
          )
          and true
      end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main or context.forcetrigger then
                return {
                    chips = 781
                }
        end
    end
}

SMODS.Joker{ --Chocolatebar Quotes
    key = "chocolatebarquotes",
    config = {
    },
    loc_txt = {
        ['name'] = 'Chocolatebar Quotes',
        ['text'] = {
            [1] = 'In today\'s {C:attention}video{}, {C:attention}five{} of my friends',
            [2] = 'try {C:attention}hunt{} me down and {C:attention}stop{} me',
            [3] = 'from beating {C:attention}Minecraft{}.',
            [4] = 'Can they stop me from beating the',
            [5] = '{C:dark_edition}ender dragon{} or will I {C:attention}survive{}?',
            [6] = 'This is it, {C:blue}Minecraft manhunt versus 5 hunters{},',
            [7] = 'the finale. Also, only a {C:green}small percentage{}',
            [8] = 'of people that watch my videos',
            [9] = 'are actually {C:attention}subscribed{}, so consider subscribing.',
            [10] = 'it\'s {C:green}free{} and you can always change your mind later.',
            [11] = '{C:attention}Enjoy.{}',
            [12] = '{C:inactive}(Actual effect: add one Mult {}',
            [13] = '{C:inactive}for every quote that\'s sent to cbqpl {}',
            [14] = '{C:inactive}as of 2025 August 1st 11:45 UTC+8){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    demicoloncompat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main or context.forcetrigger then
                return {
                    mult = 72
                }
        end
    end
}

SMODS.Joker{ --Doreo stream
    key = "doreostream",
    config = {
        extra = {
            source_rank_type = "all",
            target_rank = "7"
        }
    },
    loc_txt = {
        ['name'] = 'Doreo stream',
        ['text'] = {
            [1] = 'All cards count as {C:attention}7s{}',
            [2] = '{C:inactive,s:0.7}\"new pixel art for sholatro joker\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        -- Combine ranks effect enabled
    end,

    remove_from_deck = function(self, card, from_debuff)
        -- Combine ranks effect disabled
    end
}
local card_get_id_ref = Card.get_id
function Card:get_id()
    local original_id = card_get_id_ref(self)
    if not original_id then return original_id end

    if next(SMODS.find_card("j_sholatro_doreostream")) then
        return 7
    end
    return original_id
end

SMODS.Joker{ --Green Cookie
    key = "greencookie",
    config = {
        extra = {
            mult = 18,
            multiplier = 1.03
        }
    },
    loc_txt = {
        ['name'] = 'Green Cookie',
        ['text'] = {
            [1] = '{C:red}+#1#{} Mult',
            [2] = 'Increase value by {C:red}#2#x{}',
            [3] = 'when a hand is played'
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
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    demicoloncompat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult, card.ability.extra.multiplier}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main or context.forcetrigger then
                local mult_value = card.ability.extra.mult
                card.ability.extra.mult = (card.ability.extra.mult) * card.ability.extra.multiplier
                return {
                    mult = mult_value
                }
        end
    end
}
SMODS.Joker{ --Iciclez_
    key = "iciclez",
    config = {
        extra = {
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Iciclez_',
        ['text'] = {
            [1] = 'Create {C:attention}an{} {C:blue}alt{}',
            [2] = 'when {C:attention}Blind{} is selected'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    demicoloncompat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.setting_blind or context.forcetrigger then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sholatro_iciclezalt' })
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
SMODS.Joker{ --Iciclez_ alt
    key = "iciclezalt",
    config = {
		extra = {
			mult = 1.1,
			slots = 1
		}
    },
    loc_txt = {
        ['name'] = 'Iciclez_ alt',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult',
            [2] = '{C:dark_edition}+#2#{} Joker slot'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 2,
    rarity = 1,
    blueprint_compat = true,
    demicoloncompat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
	
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult, card.ability.extra.slots}}
    end,
	
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main or context.forcetrigger then
                return {
                    Xmult = lenient_bignum(card.ability.extra.mult)
                }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slots
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.slots
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_sholatro_iciclezalt" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
	if e.config.ref_table.config.center.key == "j_sholatro_iciclezalt" then
		e.config.colour = G.C.GREEN
		e.config.button = "use_card"
	else
		can_select_card_ref(e)
	end
end
SMODS.Joker{ --Issimo
    key = "issimo",
    config = {
        extra = {
            ante = 1,
            cash = 50
        }
    },
    loc_txt = {
        ['name'] = 'Issimo',
        ['text'] = {
            [1] = 'Earn {C:gold}$#2#{}, then{C:red} +#1#{} Ante when bought'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = false,
    demicoloncompat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rif' and args.source ~= 'rta' and args.source ~= 'sou' and args.source ~= 'uta' and args.source ~= 'wra' 
          or args.source == 'sho'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.ante, card.ability.extra.cash}}
    end,

    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers or context.forcetrigger then
                return {
                    dollars = card.ability.extra.cash,
                    extra = {
                        func = function()
                    local mod = card.ability.extra.ante
		ease_ante(mod)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
				return true
			end,
		}))
                    return true
                end,
                            message = "Ante +" .. card.ability.extra.ante,
                        colour = G.C.FILTER
                        }
                }
        end
    end
}

SMODS.Joker{ --Ten the purples
    key = "tenthepurples",
    config = {
    },
    loc_txt = {
        ['name'] = 'Ten the purples',
        ['text'] = {
            [1] = 'When {C:attention}Boss Blind{} is selected,',
            [2] = '{C:attention}disable{} Blind effect and {C:red}X2{} Blind size',
            [3] = '{C:inactive,s:0.7}haha every boss blinds are the wall now{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
            if G.GAME.blind.boss then
                return {
                    func = function()
                        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.GAME.blind:disable()
                                    play_sound('timpani')
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled'), colour = G.C.GREEN})
                        end
                        return true
                    end,
                    extra = {
                        
                        func = function()
                            if G.GAME.blind.in_blind then
                                G.GAME.blind.chips = G.GAME.blind.chips * 2
                                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                                G.HUD_blind:recalculate()
                                return true
                            end
                        end,
                        colour = G.C.GREEN
                    }
                }
            end
        end
    end
}

if Cryptid then
SMODS.Joker{ --Ninja Kiwi balance be like
    key = "nksucks",
    config = {
        extra = {
            version = 53
        }
    },
    loc_txt = {
        ['name'] = 'Ninja Kiwi balance be like',
        ['text'] = {
            [1] = 'At the end of round,',
            [2] = '{C:attention}Increase{} value of Joker to the {C:attention}right{} by {C:attention}50%{},',
            [3] = '{C:attention}Decrease{} value of Joker to the {C:attention}left{} by {C:attention}50%{}',
            [4] = 'if both Jokers have mutable values'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
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
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.version}}
    end,
    
	calculate = function(self, card, context)
		if
			(context.end_of_round and not context.repetition and not context.individual and not context.blueprint)
			or context.forcetrigger
		then
			local check = false
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					if i < #G.jokers.cards and i >1 then
						if not (Card.no(G.jokers.cards[i + 1], "immutable", true) or Card.no(G.jokers.cards[i - 1], "immutable", true)) then
							check = true
							Cryptid.manipulate(G.jokers.cards[i + 1], { value = 1.5 })
							Cryptid.manipulate(G.jokers.cards[i - 1], { value = 0.5 })
						end
					end
				end
			end
			if check then
				card_eval_status_text(
					card,
					"extra",
					nil,
					nil,
					nil,
					{ message = 'update is out!', colour = G.C.GREEN }
				)
			end
		end
	end
}
end

if Talisman then

SMODS.Joker{ --Pudding Egg
    key = "puddingegg",
    config = {
        extra = {
            slots = 1
        }
    },
    loc_txt = {
        ['name'] = 'Pudding Egg',
        ['text'] = {
            [1] = '{C:dark_edition}+#1#{} Joker slot',
            [2] = 'at end of round'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 30,
    rarity = "sholatro_the_expert",
    blueprint_compat = false,
    demicoloncompat = true,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rif' and args.source ~= 'rta' and args.source ~= 'sou' and args.source ~= 'uta' and args.source ~= 'wra' 
          or args.source == 'sho'
          )
          and true
      end,
		
	loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.slots}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval or context.forcetrigger then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.slots).." Joker Slot", colour = G.C.DARK_EDITION})
                G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slots
                return true
            end
                }
        end
    end
}
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
        x = 7,
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
                FormatArrowMult(card.ability.extra.operator, 5)
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

SMODS.Joker{ --The Pudding
    key = "thepudding",
    config = {
        extra = {
            operator = 0,
            mult = 1.8
        }
    },
    loc_txt = {
        ['name'] = 'The Pudding',
        ['text'] = {
            [1] = '{X:dark_edition,C:white}#1#{} Mult',
            [2] = '{X:dark_edition,C:white}operator{} increases once if',
            [3] = 'played hand contains a',
            [4] = '{C:attention}Straight Flush{} and a {C:attention}7{}',
        },
        ['unlock'] = {
            [1] = ''
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
    cost = 30,
    rarity = "sholatro_the_expert",
    blueprint_compat = true,
    demicoloncompat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rif' and args.source ~= 'rta' and args.source ~= 'sou' and args.source ~= 'uta' and args.source ~= 'wra' 
            or args.source == 'sho'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {FormatArrowMult(math.ceil(card.ability.extra.operator), card.ability.extra.mult)}}
    end,
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            if (next(context.poker_hands["Straight Flush"]) and (function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:get_id() == 7 then
                        count = count + 1
                    end
                end
                return count >= 1
            end)()) then
                return {
                    func = function()
                        card.ability.extra.operator = (card.ability.extra.operator) + 1
                        return true
                    end,
                    message = localize('k_upgrade_ex')
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main or context.forcetrigger then
			if to_big(card.ability.extra.operator) <= to_big(-1) then
				return {
					mult = lenient_bignum(card.ability.extra.mult)
				}
			elseif to_big(card.ability.extra.operator) == to_big(0) then
				return {
                    Xmult = lenient_bignum(card.ability.extra.mult)
				}
			elseif to_big(card.ability.extra.operator) == to_big(1) then
				return {
					emult = lenient_bignum(card.ability.extra.mult)
				}
			elseif to_big(card.ability.extra.operator) == to_big(2) then
				return {
					eemult = lenient_bignum(card.ability.extra.mult)
				}
			elseif to_big(card.ability.extra.operator) > to_big(2) then
				return {
					hypermult = {
						lenient_bignum(math.ceil(card.ability.extra.operator)),
						lenient_bignum(card.ability.extra.mult)
					}
				}
			end
        end
    end
}

end