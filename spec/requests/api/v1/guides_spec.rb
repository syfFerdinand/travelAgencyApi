require 'swagger_helper'

RSpec.describe 'api/v1/guides', type: :request do

  path '/api/v1/guides' do

    get('list guides') do
      tags 'Guides'

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

    post('create guide') do
      tags 'Guides'
      consumes 'application/json'
      parameter name: :guide, in: :body, schema: {
        type: :object,
        properties: { 
          LastName: {type: :string},
          FirstName: {type: :string},
          Age: {type: :integer},
          sex: {type: :string},
        },
        required: [ 'LastName', 'FirstName', 'Age', 'sex']
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

  path '/api/v1/guides/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show guide') do
      tags 'Guides'


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

    patch('update guide') do
      tags 'Guides'
      consumes 'application/json'
      parameter name: :guide, in: :body, schema: {
        type: :object,
        properties: { 
          LastName: {type: :string},
          FirstName: {type: :string},
          Age: {type: :integer},
          sex: {type: :string},
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

    put('update guide') do
      tags 'Guides'
      consumes 'application/json'
      parameter name: :guide, in: :body, schema: {
        type: :object,
        properties: { 
          LastName: {type: :string},
          FirstName: {type: :string},
          Age: {type: :integer},
          sex: {type: :string},
        },
        required: [ 'LastName', 'FirstName', 'Age', 'sex']
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

    delete('delete guide') do
      tags 'Guides'
      
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
