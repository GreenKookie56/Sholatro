if Talisman then
SMODS.Rarity {
    key = "the_expert",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.001,
    badge_colour = HEX('609621'),
    loc_txt = {
      ['default'] = {
            name = "The Expert"
        },
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}
end
