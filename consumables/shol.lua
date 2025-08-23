SMODS.Consumable {
    key = 'shol',
    set = 'Spectral',
    pos = { x = 2, y = 0 },
    loc_txt = {
        name = 'Shol',
        text = {
        [1] = 'Create a {C:attention}Joker{}',
        [2] = 'with {C:attention}The Pro{} rarity'
    }
    },
    cost = 4,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.4,
                  func = function()
                      play_sound('timpani')
                      SMODS.add_card({ set = 'Joker', rarity = 'sholatro_the_pro' })
                      used_card:juice_up(0.3, 0.5)
                      return true
                  end
              }))
              delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}