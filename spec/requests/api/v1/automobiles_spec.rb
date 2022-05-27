require 'swagger_helper'

RSpec.describe 'api/v1/automobiles', type: :request do

  path '/api/v1/automobiles' do

    get('list automobiles') do
      tags 'Automobiles'

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

    post('create automobile') do
      tags 'Automobiles'
      consumes 'application/json'
      parameter name: :automobile, in: :body, schema: {
        type: :object,
        properties: { 
          autoBrand: {type: :string},
          autoModel: {type: :string},
          autoDescription: {type: :string},
        },
        required: [ 'autoBrand','autoModel','autoDescription']
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

  path '/api/v1/automobiles/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show automobile') do
      tags 'Automobiles'


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

    patch('update automobile') do
      tags 'Automobiles'
      consumes 'application/json'
      parameter name: :automobile, in: :body, schema: {
        type: :object,
        properties: { 
          autoBrand: {type: :string},
          autoModel: {type: :string},
          autoDescription: {type: :string},
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

    put('update automobile') do
      tags 'Automobiles'
      consumes 'application/json'
      parameter name: :automobile, in: :body, schema: {
        type: :object,
        properties: { 
          autoBrand: {type: :string},
          autoModel: {type: :string},
          autoDescription: {type: :string},
        },
        required: [ 'autoBrand','autoModel','autoDescription']
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

    delete('delete automobile') do
      tags 'Automobiles'
      
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
