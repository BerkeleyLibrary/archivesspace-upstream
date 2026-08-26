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
      expect(html).to include("tabindex='0'")
    end

    it 'strips HTML before setting the aria-label' do
      html = helper.render_token(
        uri: '/repositories/1/resources/2',
        type: 'resource',
        label: +'<em>Test</em> Label'
      )

      expect(html).to include('aria-label="Test Label"')
      expect(html).not_to include('aria-label="<em>Test</em> Label"')
    end
  end
end
