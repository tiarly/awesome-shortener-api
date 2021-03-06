# frozen_string_literal: true

class UrlValidator < ActiveModel::EachValidator
  DEFAULT_MESSAGE = 'is not a valid URL'

  # rubocop:disable Layout/LineLength
  URL_REGEX = %r{^(http://www\.|https://www\.|http://|https://)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?$}.freeze
  # rubocop:enable Layout/LineLength

  def validate_each(record, attribute, value)
    valid = (URL_REGEX =~ value)
    record.errors[attribute] << (options[:message] || DEFAULT_MESSAGE) unless valid
  end
end
