# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

describe ApplicationHelper do
  describe '#render_token' do
    it 'adds an aria-label derived from the token label' do
      html = helper.render_token(
        uri: '/repositories/1/resources/2',
        type: 'resource',
        label: +'Test Label'
      )

      expect(html).to include('aria-label="Test Label"')
      expect(html).to include('href="/resolve/readonly?uri=/repositories/1/resources/2"')
      expect(html).to include('tabindex="0"')
      expect(html).not_to include('has-popover')
    end
  end
end
