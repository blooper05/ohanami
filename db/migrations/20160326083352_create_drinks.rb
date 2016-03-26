Hanami::Model.migration do
  change do
    create_table :drinks do
      primary_key :id
      column :name,    String, null: false
      column :country, String, null: false
    end
  end
end
