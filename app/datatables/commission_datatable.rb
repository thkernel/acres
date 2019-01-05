class CommissionDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }

     
      amount_credit: {source: "Commission.amount_credit"},
      production_date: {source: "Commission.production_date"},
      acte_date: {source: "Commission.acte_date"},
      bank_name: {source: "Commission.bank_name"},
      credit_id: {source: "Commission.credit_id"},
      contributor_name: {source: "Commission.contributor_name"},
      contributor_commission_percentage: {source: "Commission.contributor_commission_percentage"},
      contributor_commission: {source: "Commission.contributor_commission"},
      producer_name: {source: "Commission.producer_name"},
      producer_commission_percentage: {source: "Commission.producer_commission_percentage"},
      producer_commission: {source: "Commission.producer_commission"},
      company_commission_percentage: {source: "Commission.company_commission_percentage"},
      bank_commission: {source: "Commission.bank_commission"},
      company_commission: {source: "Commission.company_commission"}

    }
  end

  def data
    records.map do |record|
      {
        # example:
        # id: record.id,
        # name: record.name

        amount_credit: record.amount_credit,
        production_date: record.production_date,
        acte_date: record.acte_date,
        bank_name: record.bank_name,
        credit_id: record.credit_id,
        contributor_name: record.contributor_name,
        contributor_commission_percentage: record.contributor_commission_percentage,
        contributor_commission: record.contributor_commission,
        producer_name: record.producer_name,
        producer_commission_percentage: record.producer_commission_percentage,
        producer_commission: record.producer_commission,
        company_commission_percentage: record.company_commission_percentage,
        bank_commission: record.bank_commission,
        company_commission: record.company_commission

      }
    end
  end

  def get_raw_records
    # insert query here
    # User.all

    Commission.all
    
    
  end

end
