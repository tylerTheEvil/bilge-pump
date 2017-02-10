module BilgePump
  module Assertions
    module Html
      def bilge_assert_index_response(collection_assign_name, items)
        expect(response).to be_success
        expect(assigns(collection_assign_name)).to include items.first
        expect(collection_assign_name).to include items.last
      end

      def bilge_assert_new_response(item_assign_name)
        expect(response).to be_success
        expect(assigns(item_assign_name)).to be_new_record
      end

      def bilge_assert_create_response(options, expected_attrs, created_model)
        expect(response).to be_redirect
        bilge_assert_model_attributes expected_attrs, created_model
      end

      def bilge_assert_edit_response(model, item_assign_name)
        expect(response).to be_success
        expect(assigns(item_assign_name)).to eq(model)
      end

      def bilge_assert_update_response(options, expected_attrs, model)
        expect(response).to be_redirect
        bilge_assert_model_attributes expected_attrs, model
      end

      def bilge_assert_show_response(model, item_assign_name)
        expect(response).to be_success
        expect(assigns(item_assign_name)).to eq(model)
      end

      def bilge_assert_destroy_response(options, model)
        expect(response).to be_redirect
        expect(model.class.find_by_id(model.id)).to be_nil
      end
    end
  end
end
