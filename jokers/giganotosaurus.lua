SMODS.Joker{ --Giganotosaurus
    key = "giganotosaurus",
    config = {
        extra = {
            hands = 5,
            Xmult = 12,
            round = 0
        }
    },
    loc_txt = {
        ['name'] = 'Giganotosaurus',
        ['text'] = {
            [1] = '{X:red,C:white}X12{} Mult',
            [2] = '{C:blue}-5{} hands when a',
            [3] = 'hand is played'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 2
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
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.hands).." Hand", colour = G.C.RED})
                G.GAME.current_round.hands_left = G.GAME.current_round.hands_left - card.ability.extra.hands
                return true
            end,
                    extra = {
                        Xmult = card.ability.extra.Xmult
                        }
                }
        end
    end
}