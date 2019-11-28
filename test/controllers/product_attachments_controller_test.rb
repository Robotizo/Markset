require 'test_helper'

class ProductAttachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_attachment = product_attachments(:one)
  end

  test "should get index" do
    get product_attachments_url
    assert_response :success
  end

  test "should get new" do
    get new_product_attachment_url
    assert_response :success
  end

  test "should create product_attachment" do
    assert_difference('ProductAttachment.count') do
      post product_attachments_url, params: { product_attachment: { image: @product_attachment.image, product_id: @product_attachment.product_id } }
    end

    assert_redirected_to product_attachment_url(ProductAttachment.last)
  end

  test "should show product_attachment" do
    get product_attachment_url(@product_attachment)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_attachment_url(@product_attachment)
    assert_response :success
  end

  test "should update product_attachment" do
    patch product_attachment_url(@product_attachment), params: { product_attachment: { image: @product_attachment.image, product_id: @product_attachment.product_id } }
    assert_redirected_to product_attachment_url(@product_attachment)
  end

  test "should destroy product_attachment" do
    assert_difference('ProductAttachment.count', -1) do
      delete product_attachment_url(@product_attachment)
    end

    assert_redirected_to product_attachments_url
  end
end
