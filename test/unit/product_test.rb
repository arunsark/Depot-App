require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  
  # Replace this with your real tests.
  test "product attributes cannot be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be postive" do
    product = Product.new(:title=>"My Title",
                          :description => "descxxxdesc",
                          :image_url => "desc.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01",
    product.errors[:price].join(' ')

    product.price = 0
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01",
    product.errors[:price].join('; ')

    product.price = 1
    assert product.valid?
  end

  test "image url" do
    ok = %w{ fred.jpg fred.gif fred.png Fred.JPG Fred.Png
http://a.com/ab/ab/fred.gif}
    
    bad = %w{ fred.doc fred.gif/more fred.png.more Fred.JP }

    ok.each do |name|
      assert new_product(name).valid?,  "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "product is not valid without unique title" do

    product = Product.new(:title => products(:ruby).title,
                          :description => "xxxxxxx",
                          :image_url => "ruby.gif",
                          :price => 49)
    assert product.invalid?
    assert !product.save
    assert_equal "has already been taken", product.errors[:title].join('; ')
  end


   test "product is not valid without unique title - i18n" do

    product = Product.new(:title => products(:ruby).title,
                          :description => "xxxxxxxxxxx",
                          :image_url => "ruby.gif",
                          :price => 49)
    assert product.invalid?
    assert !product.save
    assert_equal I18n.translate('activerecord.errors.messages.taken'),product.errors[:title].join('; ')
  end

  test "product has minimum 10 character description" do
    product = Product.new(:title => "Invalid Description",
                          :description => "xxx",
                          :image_url => "ruby.gif",
                          :price => 49)
    assert product.invalid?, "#{product.description} is too short"
    assert_equal "is too short (minimum is 10 characters)",
    product.errors[:description].join(' ')

  end


  def new_product(image_url)
    Product.new(:title=>"Title",
                :description => "Desc Desc Desc",
                :image_url => image_url,
                :price => 10.95
                )
  end
end
