require 'swagger_helper'

RSpec.describe 'api/v1/cities', type: :request do

  path '/api/v1/cities' do

    get('list cities') do
      tags 'Cities'

      response(200, 'successful') do

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

    post('create city') do
      tags 'Cities'
      consumes 'application/json'
      parameter name: :city, in: :body, schema: {
        type: :object,
        properties: { 
          cityName:{type: :string}, 
          cityDescriptif:{type: :string}, 
          cityDateCreated:{type: :date},
        },
        required: [ 'cityName','cityDescriptif','cityDateCreated']
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

  path '/api/v1/cities/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show city') do
      tags 'Cities'


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

    end

    patch('update city') do
      tags 'Cities'
      consumes 'application/json'
      parameter name: :city, in: :body, schema: {
        type: :object,
        properties: { 
          cityName:{type: :string}, 
          cityDescriptif:{type: :string}, 
          cityDateCreated:{type: :date},
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

    put('update city') do
      tags 'Cities'
      consumes 'application/json'
      parameter name: :city, in: :body, schema: {
        type: :object,
        properties: { 
          cityName:{type: :string}, 
          cityDescriptif:{type: :string}, 
          cityDateCreated:{type: :date},
        },
        required: [ 'cityName','cityDescriptif','cityDateCreated']
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

    delete('delete city') do
      tags 'Cities'
      
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
