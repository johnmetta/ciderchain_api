class InitialMigration < ActiveRecord::Migration[5.2]
  def change
    create_table :additions, force: :cascade do |t|
      t.float    :amount
      t.integer  :racking_id
      t.integer  :unit_id
      t.datetime :created_at,  null: false
      t.datetime :updated_at,  null: false
      t.text     :notes
      t.integer  :additive_id
    end

    create_table :additives, force: :cascade do |t|
      t.string   :name
      t.text     :notes
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end

    create_table :additive_sources do |t|
      t.integer :source_id
      t.integer :additive_id

      t.timestamps null: false
    end

    create_table :batches, force: :cascade do |t|
      t.string   :code
      t.integer  :volume
      t.string   :name
      t.string   :notes
      t.integer  :unit_id
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end

    create_table :batch_sources do |t|
      t.integer :batch_id
      t.integer :source_id

      t.timestamps null: false
    end

    create_table :measurements, force: :cascade do |t|
      t.string   :name
      t.float    :value
      t.integer  :racking_id
      t.integer  :unit_id
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end

    create_table :sources, force: :cascade do |t|
      t.string   :name
      t.text     :notes
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end

    create_table :states, force: :cascade do |t|
      t.string   :name
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end

    create_table :rackings, force: :cascade do |t|
      t.integer  :volume
      t.integer  :batch_id
      t.integer  :unit_id
      t.integer  :vessel_id
      t.integer  :state_id
      t.datetime :closed
      t.datetime :created_at,   null: false
      t.datetime :updated_at,   null: false
      t.integer  :closed_by_id
    end

    create_table :units, force: :cascade do |t|
      t.string   :name
      t.integer  :dimensions
      t.float    :factor
      t.integer  :base_id
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.string   :short_name
    end

    create_table :vessel_types, force: :cascade do |t|
      t.string   :name
      t.string   :abbreviation
      t.datetime :created_at,   null: false
      t.datetime :updated_at,   null: false
    end

    create_table :vessels, force: :cascade do |t|
      t.integer  :vessel_type_id
      t.string   :code
      t.integer  :volume
      t.integer  :unit_id
      t.datetime :created_at,     null: false
      t.datetime :updated_at,     null: false
    end
  end
end
