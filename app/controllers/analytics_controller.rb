class AnalyticsController < ApplicationController

  def index
    @analytics = {
      company_sizes: Company.count_all_sizes,
      company_sectors: Company.count_all_sectors,
      industry_companies: Industry.count_companies
    }
  end
end
