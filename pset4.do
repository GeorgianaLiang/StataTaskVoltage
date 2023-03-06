use ".\health.dta"
describe

gen lg_cost_t = ln(cost_t + 1)
gen lg_cost_avoidable_t = ln(cost_avoidable_t + 1)
regress lg_cost_t tm1_alcohol_elixhauser tm1_dem_black tm1_dem_female tm1_drugabuse_elixhauser aged
regress lg_cost_avoidable_t  tm1_alcohol_elixhauser tm1_dem_black tm1_dem_female tm1_drugabuse_elixhauser aged

gen aged = 1 if (tm1_dem_age_band_5564 == 1 | tm1_dem_age_band_6574 == 1 | tm1_dem_age_band_75 == 1)
replace aged = 0 if (tm1_dem_age_band_5564 == 0 & tm1_dem_age_band_6574 == 0 & tm1_dem_age_band_75 == 0)
 
graph box lg_cost_t, over( tm1_alcohol_elixhauser)
graph export ".\pset2-lg-total-cost-over-alchol.png", as(png) name("Graph")
graph box lg_cost_avoidable, over( tm1_alcohol_elixhauser)
graph export ".\pset2-lg-avoidable-cost-by-alchol.png", as(png) name("Graph")