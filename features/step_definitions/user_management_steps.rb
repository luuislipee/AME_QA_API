# frozen_string_literal: true

Given('the API address') do
  @uri_base = 'http://dummy.restapiexample.com/api/v1/'
end

When('I register a new user with the following data:') do |table|
  @data = table.rows_hash
  new_id = @data[:id]
  name = @data[:name]
  salary = @data[:salary]
  age = @data[:age]

  @api_address = @uri_base + 'create'

  @post_request = HTTParty.post(@api_address,
                                body:
                                {
                                  "name": name.to_s,
                                  "salary": salary.to_s,
                                  "age": age.to_s,
                                  "id": new_id.to_s
                                }.to_json,
                                headers: {
                                  "Content-Type": 'application/json'
                                })
end

Then('the system should create a new user') do
  expect(@post_request.code).to eq 200
end

# -------------------- DELETE USER -----------------

When('I pass the {int} as parameter for deletion') do |id|
  @api_address = @uri_base + 'delete'
  @delete_request = HTTParty.delete(@api_address + "/#{id}")
end

Then('the user should be deleted') do
  expect(@delete_request.code).to eq 200
end
