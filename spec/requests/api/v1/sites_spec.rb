require 'swagger_helper'

RSpec.describe 'api/v1/sites', type: :request do

  path '/api/v1/cities/{city_id}/sites' do
    # You'll want to customize the parameter types...
    parameter name: 'city_id', in: :path, type: :string, description: 'city_id'

    get('list sites') do
      response(200, 'successful') do
        let(:city_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create site') do
      response(200, 'successful') do
        let(:city_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/cities/{city_id}/sites/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'city_id', in: :path, type: :string, description: 'city_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show site') do
      response(200, 'successful') do
        let(:city_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update site') do
      response(200, 'successful') do
        let(:city_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update site') do
      response(200, 'successful') do
        let(:city_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete site') do
      response(200, 'successful') do
        let(:city_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
