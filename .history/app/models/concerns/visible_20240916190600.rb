module Visible
    extend ActiveSupport::Concern

    VALID_STATUSES = ["public", "private", "archived"]

    validates :status, inclusion: { in: VALID_STATUSES }

    def archived?
        status == "archived"
    end
end