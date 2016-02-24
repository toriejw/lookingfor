require 'rails_helper'

describe ApiIssue do
  context "api call returns no entries" do
    it "is created when StackOverflow returns no entries" do |variable|
      stub_request(:any, /stackoverflow/).to_rack(FakeEmptyStackOverflow)
      old_count = ApiIssue.count

      StackOverflow.scrape

      new_count = ApiIssue.count
      new_api_issue = ApiIssue.last

      expect(new_count - old_count).to eq(1)

      expect(new_api_issue.service).to eq("StackOverflow")
      expect(new_api_issue.type).to eq("No Entries")
    end
  end
end
