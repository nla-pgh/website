# This migration comes from refinery_copywriting (originally 2)
class CreateCopywritingTranslationTable < ActiveRecord::Migration

  def self.up
    ::Refinery::Copywriting::Phrase.table_name = Refinery::Copywriting::Phrase.table_name.sub('refinery_', '')
    ::Refinery::Copywriting::Phrase.module_eval do
      has_many :translations, :foreign_key => 'copywriting_phrase_id'
    end
    ::Refinery::Copywriting::Phrase.translation_class.table_name = Refinery::Copywriting::Phrase.translation_class.table_name.sub('refinery_', '')

    ::Refinery::Copywriting::Phrase.create_translation_table!({
      :value => :text
    }, {
      :migrate_data => true
    })

    rename_column Refinery::Copywriting::Phrase.translation_class.table_name, :copywriting_phrase_id, :refinery_copywriting_phrase_id

    ::Refinery::Copywriting::Phrase.table_name = "refinery_#{Refinery::Copywriting::Phrase.table_name}"
    ::Refinery::Copywriting::Phrase.module_eval do
      has_many :translations, :foreign_key => 'refinery_copywriting_phrase_id'
    end
    ::Refinery::Copywriting::Phrase.translation_class.table_name = "refinery_#{Refinery::Copywriting::Phrase.translation_class.table_name}"
  end

  def self.down
    ::Refinery::Copywriting::Phrase.table_name = Refinery::Copywriting::Phrase.table_name.sub('refinery_', '')
    ::Refinery::Copywriting::Phrase.module_eval do
      has_many :translations, :foreign_key => 'refinery_copywriting_phrase_id'
    end
    ::Refinery::Copywriting::Phrase.translation_class.table_name = Refinery::Copywriting::Phrase.translation_class.table_name.sub('refinery_', '')

    ::Refinery::Copywriting::Phrase.drop_translation_table! :migrate_data => true

    ::Refinery::Copywriting::Phrase.table_name = "refinery_#{Refinery::Copywriting::Phrase.table_name}"
    ::Refinery::Copywriting::Phrase.module_eval do
      has_many :translations, :foreign_key => 'copywriting_phrase_id'
    end
    ::Refinery::Copywriting::Phrase.translation_class.table_name = "refinery_#{Refinery::Copywriting::Phrase.translation_class.table_name}"
  end

end
