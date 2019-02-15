require 'rails_helper'

RSpec.describe UrlsController, type: :request do
  describe '#show' do
    let(:url) { FactoryBot.create :url }

    it 'normal' do
      get url_path(url.short_url)
      expect(json_response[:url]).to eq(url.original_url)
    end
  end

  describe '#create' do
    let(:url) { FactoryBot.attributes_for :url }
    it 'normal' do
      post urls_path params: { url: url }
    end
  end
end