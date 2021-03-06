require 'rails_helper'

describe StackOverflow do
  let(:service){ StackOverflow }

  describe '.pull_company_name' do
    it 'pulls a company from a title' do
      title = "Principal Software Engineer at Comcast (Philadelphia, PA)"
      company_name = service.pull_company_name(title)
      expect(company_name).to eq('Comcast')
    end

    it 'handles unmatching pattern' do
      title = "Principal Software Engineer Comcast (Philadelphia, PA)"
      company_name = service.pull_company_name(title)
      expect(company_name).to eq('')
    end
  end

  describe '.pull_location' do
    it 'pulls a location from a title' do
      title = "Principal Software Engineer at Comcast (Philadelphia, PA)"
      company_name = service.pull_location(title)
      expect(company_name).to eq('Philadelphia, PA')
    end

    it 'handles unmatching pattern' do
      title = "Principal Software Engineer at Comcast"
      company_name = service.pull_location(title)
      expect(company_name).to eq('')
    end
  end

  describe '.is_remote?' do
    context 'when title contains remote' do
      it 'returns true' do
        title = 'remote job'
        expect(service.is_remote?(title)).to be true
      end
    end
    context 'when title does not contain' do
      it 'returns false' do
        title = 'in Southern California'
        expect(service.is_remote?(title)).to be false
      end
    end
    context 'when title is nil' do
      it 'returns false' do
        title = nil
        expect(service.is_remote?(title)).to be false
      end
    end
  end
end
