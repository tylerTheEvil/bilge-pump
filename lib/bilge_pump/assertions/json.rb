module BilgePump
  module Assertions
    module Json
      def bilge_json_response
        bilge_json response.body
      end

      def bilge_json(text)
        ActiveSupport::JSON.decode(text)
      end

      def bilge_assert_index_response(collection_assign_name, items)
        expect(response).to be_success

        models = bilge_json_response

        expect(models).to include bilge_json(items.first.to_json)
        expect(models).to include bilge_json(items.last.to_json)
      end

      def bilge_assert_new_response(item_assign_name)
        expect(response).to be_success
      end

      CREATED = '201'
      def bilge_assert_create_response(options, expected_attrs, created_model)
        expect(response.code).to eq(CREATED)
        expect(bilge_json_response).to eq(bilge_json(created_model.to_json))
        bilge_assert_model_attributes expected_attrs, created_model
      end

      def bilge_assert_edit_response(model, item_assign_name)
        expect(response).to be_success
      end

      def bilge_assert_update_response(options, expected_attrs, model)
        expect(response.code).to eq(CREATED)
        bilge_assert_model_attributes expected_attrs, model
        expect(bilge_json_response).to eq(bilge_json(model.to_json))
      end

      def bilge_assert_show_response(model, item_assign_name)
        expect(response).to be_success
        expect(bilge_json_response).to eq(bilge_json(model.to_json))
      end

      def bilge_assert_destroy_response(options, model)
        expect(response).to be_success
        expect(model.class.find_by_id(model.id)).to be_nil
      end
    end
  end
end
