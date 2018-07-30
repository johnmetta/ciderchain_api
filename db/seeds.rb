Unit.create!([
               { name: 'liter', dimensions: 3, factor: 1.0, base_id: nil, short_name: 'L' },
               { name: 'gram', factor: 1.0, base_id: nil, short_name: 'g' }
             ])
Unit.create!([
               { name: 'gallon', dimensions: 3, factor: 3.78541178, base_id: Unit.liter.id, short_name: 'gal' },
               { name: 'barrel', dimensions: 3, factor: 225.0, base_id: Unit.liter.id, short_name: 'BBL' },
               { name: 'milliliter', factor: 0.001, base_id: Unit.liter.id, short_name: 'ml' },
               { name: 'milligram', factor: 0.001, base_id: Unit.gram.id, short_name: 'mg' },
             ])
Batch.create!([
                { code: '2016C0001', volume: 50, name: 'Emperium', unit_id: Unit.gallon.id },
                { code: '2016C0002', volume: 50, name: 'Mystrale', unit_id: Unit.gallon.id },
                { code: '2016C0003', volume: 225, unit_id: Unit.liter.id }
              ])
Source.create!([
                 { name: 'Hood River Juice Company', notes: nil },
                 { name: 'Eddie Salminen', notes: nil },
                 { name: 'McCurdy Farms', notes: 'Through Oregon Growers and Shippers' },
                 { name: "Vintner's Vault" },
                 { name: 'Brewcraft' }
               ])
BatchSource.create! batch_id: Batch.first.id, source_id: Source.first.id
Additive.create!([
                   { name: 'Watermelon Honey' },
                   { name: 'Malic acid' },
                   { name: 'Potassium metabisulphite' }
                 ])
AdditiveSource.create!([
                         { additive_id: Additive.find_by_name('Watermelon Honey').id, source_id: Source.find_by_name('McCurdy Farms').id },
                         { additive_id: Additive.find_by_name('Malic acid'), source_id: Source.find_by_name("Vintner's Vault").id },
                         { additive_id: Additive.find_by_name('Potassium metabisulphite'), source_id: Source.find_by_name("Vintner's Vault").id }
                       ])
State.create!([
                { name: 'ordered' },
                { name: 'preparation' },
                { name: 'primary' },
                { name: 'secondary' },
                { name: 'aging' },
                { name: 'carbonation' },
                { name: 'packaged' }
              ])
VesselType.create!([
                     { name: 'FlexTank', abbreviation: 'FT' },
                     { name: 'Brite Tank', abbreviation: 'Brite' },
                     { name: 'Barrel', abbreviation: 'BBL' },
                   ])
Vessel.create!([
                 { vessel_type_id: VesselType.barrel.id, code: 'BBL101_wine', volume: 225, unit_id: Unit.liter.id },
                 { vessel_type_id: VesselType.barrel.id, code: 'BBL102_wine', volume: 225, unit_id: Unit.liter.id },
                 { vessel_type_id: VesselType.barrel.id, code: 'BBL103_wine', volume: 225, unit_id: Unit.liter.id },
                 { vessel_type_id: VesselType.barrel.id, code: 'BBL104_wine', volume: 225, unit_id: Unit.liter.id },
                 { vessel_type_id: VesselType.barrel.id, code: 'BBL105_wine', volume: 225, unit_id: Unit.liter.id },
                 { vessel_type_id: VesselType.barrel.id, code: 'BBL106_wine', volume: 225, unit_id: Unit.liter.id },
                 { vessel_type_id: VesselType.barrel.id, code: 'BBL107_wine', volume: 225, unit_id: Unit.liter.id },
                 { vessel_type_id: VesselType.barrel.id, code: 'BBL108_wine', volume: 225, unit_id: Unit.liter.id },
                 { vessel_type_id: VesselType.barrel.id, code: 'BBL109_wine', volume: 225, unit_id: Unit.liter.id },
                 { vessel_type_id: VesselType.barrel.id, code: 'BBL110_wine', volume: 225, unit_id: Unit.liter.id },
                 { vessel_type_id: VesselType.barrel.id, code: 'BBL111_wine', volume: 225, unit_id: Unit.liter.id },
                 { vessel_type_id: VesselType.barrel.id, code: 'BBL112_wine', volume: 225, unit_id: Unit.liter.id },
                 { vessel_type_id: VesselType.barrel.id, code: 'BBL113_bourbon', volume: 195, unit_id: Unit.liter.id },
                 { vessel_type_id: VesselType.barrel.id, code: 'BBL114_bourbon', volume: 195, unit_id: Unit.liter.id },
                 { vessel_type_id: VesselType.barrel.id, code: 'BBL115_bourbon', volume: 195, unit_id: Unit.liter.id },
                 { vessel_type_id: VesselType.barrel.id, code: 'BBL116_bourbon', volume: 195, unit_id: Unit.liter.id },
                 { vessel_type_id: VesselType.flex_tank.id, code: 'FT50_1', volume: 50, unit_id: Unit.gallon.id },
                 { vessel_type_id: VesselType.flex_tank.id, code: 'FT50_2', volume: 50, unit_id: Unit.gallon.id },
                 { vessel_type_id: VesselType.flex_tank.id, code: 'FT70_1', volume: 70, unit_id: Unit.gallon.id },
                 { vessel_type_id: VesselType.flex_tank.id, code: 'FT70_2', volume: 70, unit_id: Unit.gallon.id },
                 { vessel_type_id: VesselType.flex_tank.id, code: 'FT80_1', volume: 80, unit_id: Unit.gallon.id },
                 { vessel_type_id: VesselType.flex_tank.id, code: 'FT80_2', volume: 80, unit_id: Unit.gallon.id },
                 { vessel_type_id: VesselType.flex_tank.id, code: 'FT80_3', volume: 80, unit_id: Unit.gallon.id },
                 { vessel_type_id: VesselType.flex_tank.id, code: 'FT80_4', volume: 80, unit_id: Unit.gallon.id },
                 { vessel_type_id: VesselType.flex_tank.id, code: 'FT80_5', volume: 80, unit_id: Unit.gallon.id },
                 { vessel_type_id: VesselType.flex_tank.id, code: 'FT80_6', volume: 80, unit_id: Unit.gallon.id },
                 { vessel_type_id: VesselType.flex_tank.id, code: 'FT200_1', volume: 200, unit_id: Unit.gallon.id },
                 { vessel_type_id: VesselType.flex_tank.id, code: 'FT300_1', volume: 300, unit_id: Unit.gallon.id },
                 { vessel_type_id: VesselType.flex_tank.id, code: 'FT300_2', volume: 300, unit_id: Unit.gallon.id }
               ])
Racking.create!([
                  { volume: 50, batch_id: 1, unit_id: Unit.gallon.id, vessel_id: Vessel.find_by_code('FT50_1').id, state_id: 4, closed: nil },
                  { volume: 50, batch_id: 2, unit_id: Unit.gallon.id, vessel_id: Vessel.find_by_code('FT50_2').id, state_id: 4, closed: nil },
                  { volume: 225, batch_id: 3, unit_id: Unit.liter.id, vessel_id: Vessel.find_by_code('BBL112_wine').id, state_id: 5, closed: nil }
                ])
User.create!([
               { email: 'john@spokeandsail.com', password: 'et48ID', password_confirmation: 'et48ID', remember_me_token: nil, remember_me_token_expires_at: nil, reset_password_token: nil, reset_password_token_expires_at: nil, reset_password_email_sent_at: nil }
             ])
%w{TA pH temperature brix SO2 malic\ acid}.each do |prop|
  Property.create!(name: prop)
end
