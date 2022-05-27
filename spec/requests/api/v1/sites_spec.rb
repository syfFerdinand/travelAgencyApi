require 'swagger_helper'

RSpec.describe 'api/v1/sites', type: :request do

  path '/api/v1/cities/{city_id}/sites' do
    # You'll want to customize the parameter types...
    parameter name: 'city_id', in: :path, type: :string, description: 'city_id'

    get('list sites') do
      tags 'Sites'
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
      tags 'Sites'
      consumes 'application/json'
      parameter name: :site, in: :body, schema: {
        type: :object,
        properties: { 
          siteName:{type: :string}, 
          siteDescription:{type: :text}, 
          siteOpeningDate:{type: :date}, 
        },
        required: [ 'siteName', 'siteDescription', 'siteOpeningDate', 'city_id']
      }

      response(201, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
      
      response(400, 'Bad Request') do
        
        run_test!
      end

    end
  end

  path '/api/v1/cities/{city_id}/sites/{id}' do
    # You'll want to customize the parameter types...
    #parameter name: 'city_id', in: :path, type: :string, description: 'city_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show site') do
      tags 'Sites'
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

      response(404, 'Not Found') do
        run_test!
      end

    end

    patch('update site') do
      tags 'Sites'
      consumes 'application/json'
      parameter name: :site, in: :body, schema: {
        type: :object,
        properties: { 
          siteName:{type: :string}, 
          siteDescription:{type: :text}, 
          siteOpeningDate:{type: :date}, 
          city_id:{type: :integer},
        },
      }

      response(200, 'successful') do
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

      response(404, 'Not Found') do
        run_test!
      end

      response(400, 'Bad Request') do
        run_test!
      end

    end

    put('update site') do
      tags 'Sites'
      consumes 'application/json'
      parameter name: :site, in: :body, schema: {
        type: :object,
        properties: { 
          siteName:{type: :string}, 
          siteDescription:{type: :text}, 
          siteOpeningDate:{type: :date}, 
          city_id:{type: :integer},
        },
        required: [ 'siteName', 'siteDescription', 'siteOpeningDate', 'city_id']
      }

      response(204, 'successful') do
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

      response(404, 'Not Found') do
        run_test!
      end

      response(400, 'Bad Request') do
        run_test!
      end

    end

    delete('delete site') do
      tags 'Sites'
      
      response(204, 'successful') do
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

      response(404, 'Not Found') do
        run_test!
      end

      response(400, 'Bad Request') do
        run_test!
      end

    end

  end

end
