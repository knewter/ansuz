require File.dirname(__FILE__) + '/../test_helper'

class PageTest < Test::Unit::TestCase
  fixtures :pages

  # Replace this with your real tests.
  def test_ancestor_path
    page = Page.find_by_name "home"
		assert_equal page.ancestor_path, "/"
		page = Page.find_by_name "second"
		assert_equal page.ancestor_path, "/"
		page = Page.find_by_name "third"
		assert_equal page.ancestor_path, "/second/"
		page = Page.find_by_name "fourth"
		assert_equal page.ancestor_path, "/second/third/"
  end

	def test_full_title
		page = Page.find_by_name "home"
		assert_equal page.full_title, pages(:home).full_title
		assert_equal page.title, pages(:home).title
		
		page = Page.find_by_name "second"
		assert_equal page.title, pages(:second_level).title
		assert_equal page.full_title, page.title
	end

	def test_publishable_children
		pages = pages(:second_level).children
		assert_equal pages.length, 2
		pages = pages(:second_level).publishable_children
		assert_equal pages.length, 1
	end

	def test_find_page_by_path
		page = Page.find_page_by_path []
		assert_equal page, pages(:home)
		page = Page.find_page_by_path %w(home)
		assert_equal page, pages(:home)
		page = Page.find_page_by_path %w(second)
		assert_equal page, pages(:second_level)
		page = Page.find_page_by_path %w(second third)
		assert_equal page, pages(:third_level)
		page = Page.find_page_by_path %w(second third fourth)
		assert_equal page, pages(:fourth_level)
		page = Page.find_page_by_path %w(fourth third second)
		assert_nil page
	end

	def test_find_page_by_path_invalid
		assert_nil(Page.find_page_by_path([""] * 4))
		assert_nil(Page.find_page_by_path(["second", "", "third"]))
		assert_nil(Page.find_page_by_path(["second", "third", ""]))
	end
	
	def test_find_page_by_path_multipage
		multipage = pages(:fourth_level)
		multipage.body = "Multipage 1\n{pagebreak}Multipage 2\n{pagebreak}Multipage 3\n"
		multipage.save
		multipage.reload
		test_find_page_by_path
		test_find_page_by_path_invalid

		page = Page.find_page_by_path %w(second third fourth 1)
		assert_equal page, pages(:fourth_level)
		assert_equal page.page_body, "Multipage 1\n"
		assert_equal page.page_number, 1
		assert_equal page.pages, 3

		page = Page.find_page_by_path %w(second third fourth 2)
	  assert_equal page, pages(:fourth_level)
		assert_equal page.page_body, "Multipage 2\n"
		assert_equal page.page_number, 2
		assert_equal page.pages, 3

		page = Page.find_page_by_path %w(second third fourth 3)
	  assert_equal page, pages(:fourth_level)
		assert_equal page.page_body, "Multipage 3\n"
		assert_equal page.page_number, 3
		assert_equal page.pages, 3

		page = Page.find_page_by_path %w(second third fourth )
	  assert_equal page, pages(:fourth_level)
		assert_equal page.page_body, "Multipage 1\n"
		assert_equal page.page_number, 1
		assert_equal page.pages, 3

		# Out of bounds check
		page = Page.find_page_by_path %w(second third fourth 0)
		assert_nil page
		
		page = Page.find_page_by_path %w(second third fourth 5)
	  assert_equal page, pages(:fourth_level)
		assert_nil page.page_body
		assert_equal page.page_number, 5
		assert_equal page.pages, 3

		page = Page.find_page_by_path %w(second third 5 fourth)
		assert_nil page
		page = Page.find_page_by_path %w(second third 5)
		assert_nil page		
	end

	def test_find_page_by_path_multipage_third_level
		multipage = pages(:third_level)
		multipage.body = "Multipage 1\n{pagebreak}Multipage 2\n{pagebreak}Multipage 3\n"
		multipage.save
		multipage.reload

		# Multipage in the middle of the path should be ignored
		test_find_page_by_path
		test_find_page_by_path_invalid

		page = Page.find_page_by_path %w(second third 1)
		assert_equal page, pages(:third_level)
		assert_equal page.page_body, "Multipage 1\n"
		assert_equal page.page_number, 1
		assert_equal page.pages, 3

		page = Page.find_page_by_path %w(second third 2)
	  assert_equal page, pages(:third_level)
		assert_equal page.page_body, "Multipage 2\n"
		assert_equal page.page_number, 2
		assert_equal page.pages, 3

		page = Page.find_page_by_path %w(second third 3)
	  assert_equal page, pages(:third_level)
		assert_equal page.page_body, "Multipage 3\n"
		assert_equal page.page_number, 3
		assert_equal page.pages, 3

		page = Page.find_page_by_path %w(second third )
	  assert_equal page, pages(:third_level)
		assert_equal page.page_body, "Multipage 1\n"
		assert_equal page.page_number, 1
		assert_equal page.pages, 3

		# Out of bounds check
		page = Page.find_page_by_path %w(second third 0)
		assert_nil page

		page = Page.find_page_by_path %w(second third 5)
	  assert_equal page, pages(:third_level)
		assert_nil page.page_body
		assert_equal page.page_number, 5
		assert_equal page.pages, 3

		page = Page.find_page_by_path %w(second third 5 fourth)
		assert_nil page
		page = Page.find_page_by_path %w(second 5)
		assert_nil page
		page = Page.find_page_by_path %w(2 second third)
		assert_nil page
		page = Page.find_page_by_path %w(second third fourth)
		assert_equal page, pages(:fourth_level)
	end

	def test_find_page_by_path_multipage_home
		multipage = pages(:home)
		multipage.body = "Multipage 1\n{pagebreak}Multipage 2\n{pagebreak}Multipage 3\n"
		multipage.save
		multipage.reload
		assert multipage, pages(:home)

		# Multipage in the middle of the path should be ignored
		test_find_page_by_path
		test_find_page_by_path_invalid

		page = Page.find_page_by_path %w(1)
		assert_equal page, pages(:home)
		assert_equal page.page_body, "Multipage 1\n"
		assert_equal page.page_number, 1
		assert_equal page.pages, 3

		page = Page.find_page_by_path %w(2)
	  assert_equal page, pages(:home)
		assert_equal page.page_body, "Multipage 2\n"
		assert_equal page.page_number, 2
		assert_equal page.pages, 3

		page = Page.find_page_by_path %w(3)
	  assert_equal page, pages(:home)
		assert_equal page.page_body, "Multipage 3\n"
		assert_equal page.page_number, 3
		assert_equal page.pages, 3

		page = Page.find_page_by_path %w()
	  assert_equal page, pages(:home)
		assert_equal page.page_body, "Multipage 1\n"
		assert_equal page.page_number, 1
		assert_equal page.pages, 3

		# Out of bounds check
		page = Page.find_page_by_path %w(0)
		assert_nil page

		page = Page.find_page_by_path %w(5)
	  assert_equal page, pages(:home)
		assert_nil page.page_body
		assert_equal page.page_number, 5
		assert_equal page.pages, 3

		page = Page.find_page_by_path %w(second third 5 fourth)
		assert_nil page
		page = Page.find_page_by_path %w(second 5)
		assert_nil page
		page = Page.find_page_by_path %w(2 second third)
		assert_nil page
		page = Page.find_page_by_path %w(second third fourth)
		assert_equal page, pages(:fourth_level)
	end

	def test_find_child
		page = Page.find_by_name "home"
		assert_equal page, pages(:home)
		page = page.find_child(pages(:second_level).name)
		assert_equal page, pages(:second_level)
		page = page.find_child(pages(:third_level).name)
		assert_equal page, pages(:third_level)
		page = page.find_child(pages(:fourth_level).name)
		assert_equal page, pages(:fourth_level)
		page = pages(:second_level).find_child(pages(:fourth_level).name)
		assert_nil page
		page = pages(:second_level).find_child(pages(:swap_test1).name)
		assert_nil page
		page = pages(:second_level).find_child(pages(:unpublished).name)
		assert_nil page
	end

	def test_page_type
		page = Page.new
		page.name = "test"
		page.title = "Test Page Type"
		page.parent = pages(:second_level)
		page.body = "No multipage"
		page.save
		page.reload
		assert_equal page.page_type, "page"
		page.split_page!
		assert_equal page.page_number, 1
		assert_equal page.pages, 1
		assert page.body, page.page_body
		#find_page = Page.find_page_by_path(%w()
		
		page.body = "Multipage 1\n{pagebreak}Multipage 2\n{pagebreak}Multipage 3\n"
		assert_equal page.page_type, "page" # Test before_save filter
		page.save
		page.reload
		assert_equal page.page_type, "multipage"

		# Check defaults
		page.split_page!
		assert_equal page.page_number, 1
		assert_equal page.pages, 3
		assert_equal page.page_body, "Multipage 1\n"


		# Check in-bound splits
		1.upto(3) do |i|
			page.split_page!(i)
			assert_equal page.page_number, i
			assert_equal page.pages, 3
			assert_equal page.page_body, "Multipage #{i}\n"
		end

		# Check out-of-boundsplits
		page.split_page!(0)
		assert_equal page.page_number, 0
		assert_equal page.pages, 3
		assert_nil page.page_body

		page.split_page!(5)
		assert_equal page.page_number, 5
		assert_equal page.pages, 3
		assert_nil page.page_body

		# Saving back to a normal page
		page.body = "Back to normal page"
		assert_equal page.page_type, "multipage"
		page.save
		page.reload
		assert_equal page.page_type, "page"

		page.split_page!
		assert_equal page.page_number, 1
		assert_equal page.pages, 1
		assert page.body, page.page_body
	end

	def test_page_swap
		# Check fixture integrity
		assert_equal pages(:swap_test).children.size, 3
		siblings = pages(:swap_test1).self_and_siblings
		assert_equal siblings.length, 3

		# Check siblings return correct page ordering
		assert_equal siblings[0], pages(:swap_test1)
		assert_equal siblings[1], pages(:swap_test2)
		assert_equal siblings[2], pages(:swap_test3)
		assert_equal siblings[0].page_order, pages(:swap_test1).page_order
		assert_equal siblings[1].page_order, pages(:swap_test2).page_order
		assert_equal siblings[2].page_order, pages(:swap_test3).page_order

		# Check out of bounds
		assert_nil siblings[0].swap!(-1) 
		assert_nil siblings[2].swap!(1)
		assert_nil siblings[1].swap!(-2)
		assert_nil siblings[1].swap!(2)

		# Check first swap
		assert siblings[0].swap!(1)
		siblings = pages(:swap_test1).self_and_siblings
		assert_equal siblings.length, 3
		assert_equal siblings[0], pages(:swap_test2)
		assert_equal siblings[1], pages(:swap_test1)
		assert_equal siblings[2], pages(:swap_test3)
		# Page order in the fixture should still remain the same
		assert_equal siblings[0].page_order, pages(:swap_test1).page_order
		assert_equal siblings[1].page_order, pages(:swap_test2).page_order
		assert_equal siblings[2].page_order, pages(:swap_test3).page_order

		# Check second swap
		assert siblings[1].swap!(1)
		siblings = pages(:swap_test1).self_and_siblings
		assert_equal siblings.length, 3
		assert_equal siblings[0], pages(:swap_test2)
		assert_equal siblings[1], pages(:swap_test3)
		assert_equal siblings[2], pages(:swap_test1)
		# Page order in the fixture should still remain the same
		assert_equal siblings[0].page_order, pages(:swap_test1).page_order
		assert_equal siblings[1].page_order, pages(:swap_test2).page_order
		assert_equal siblings[2].page_order, pages(:swap_test3).page_order

		# Check third swap
		assert siblings[1].swap!(-1)
		siblings = pages(:swap_test1).self_and_siblings
		assert_equal siblings.length, 3
		assert_equal siblings[0], pages(:swap_test3)
		assert_equal siblings[1], pages(:swap_test2)
		assert_equal siblings[2], pages(:swap_test1)
		# Page order in the fixture should still remain the same
		assert_equal siblings[0].page_order, pages(:swap_test1).page_order
		assert_equal siblings[1].page_order, pages(:swap_test2).page_order
		assert_equal siblings[2].page_order, pages(:swap_test3).page_order

		# Check fourth swap
		assert siblings[2].swap!(-2)
		siblings = pages(:swap_test1).self_and_siblings
		assert_equal siblings.length, 3
		assert_equal siblings[0], pages(:swap_test1)
		assert_equal siblings[1], pages(:swap_test2)
		assert_equal siblings[2], pages(:swap_test3)
		# Page order in the fixture should still remain the same
		assert_equal siblings[0].page_order, pages(:swap_test1).page_order
		assert_equal siblings[1].page_order, pages(:swap_test2).page_order
		assert_equal siblings[2].page_order, pages(:swap_test3).page_order
	end

	def test_page_order_integrity
		page = Page.new
		page.name = "page_order_integrity"
		page.title = "Test Page Order Integrity"
		page.parent = pages(:swap_test)
		page.body = "page_order_integrity"
		page.page_order = pages(:swap_test1).page_order
		page.save
		page = Page.find_by_name 'page_order_integrity'
		assert_equal page.page_order, page.last_page
	end
end
