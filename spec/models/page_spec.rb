require File.dirname(__FILE__) + '/../spec_helper'

describe Page do
  fixtures :pages

  describe '#ancestor_path' do
    it "should return / for the home page" do
      Page.find_by_name('home').ancestor_path.should eql('/pages/')
    end

    it "should return / for the second level page" do
      Page.find_by_name('second').ancestor_path.should eql('/pages/')
    end
    
    it "should return /second/ for the third level page" do
      Page.find_by_name('third').ancestor_path.should eql('/pages/second/')
    end

    it "should return /second/third/ for the fourth level page" do
      Page.find_by_name('fourth').ancestor_path.should eql('/pages/second/third/')
    end

  end

  describe "#visible" do
    it "should return pages with publish_at values in the past or nil" do
       # Rails is setting the publish_at values as nil when I specify the next two records in the fixtures file. What's up with that?  -james
       @visible_page = Page.create(:name => "Visible", :title => "I am visible", :publish_at => 1.days.ago )
       @invisible_page = Page.create(:name => "Invisible", :title => "I am invisible", :publish_at => Time.now + 1.days )
       Page.visible.find_by_name("Visible").should eql(@visible_page)
       Page.visible.find_by_name("Invisible").should eql(nil)
    end
  end

  describe '#full_title' do
    it "should override title if it is a different value" do
      @page = Page.find_by_name('home')
      @page.full_title.should eql(pages(:home).full_title)
      @page.title.should eql(pages(:home).title)
      @page.full_title.should_not eql(@page.title)
    end

    it "should default to title if full_title is not set" do
      @page = Page.find_by_name('second')
      @page.title.should eql(pages(:second_level).title)
      @page.title.should eql(@page.full_title)
    end
  end

  describe '#publishable_children' do
    it "should return children that are flagged as publishable. (DEPRECATION: This should be converted to named_scope)" do
      Page.find_by_name('second').should have(2).children
      Page.find_by_name('second').should have(1).publishable_children
    end
  end

  describe '#find_page_by_path' do
    it "should return the home page when the path is empty" do
      Page.find_page_by_path([]).should eql(pages(:home))
    end

    it "should return the home page when passed 'home'" do
      Page.find_page_by_path(%w(home)).should eql(pages(:home))
    end

    it "should return the children pages of the home page" do
      Page.find_page_by_path(%w(second)).should eql(pages(:second_level))
    end

    it "should descend the path and find the correct page" do
      Page.find_page_by_path(%w(second third)).should eql(pages(:third_level))
      Page.find_page_by_path(%w(second third fourth)).should eql(pages(:fourth_level))
    end

    it "should verify the path is in the proper sequence" do
      Page.find_page_by_path(%w(fourth third second)).should be_nil
    end

    it "should handle corrupt paths gracefully" do
      Page.find_page_by_path([""]*4).should be_nil
      Page.find_page_by_path(['second', '', 'third']).should be_nil
      Page.find_page_by_path(['second', 'third', '']).should be_nil
    end
  end

  describe 'multipage' do
    before(:each) do
      @multipage = pages(:fourth_level)
      @multipage.body = "Multipage 1\n{pagebreak}Multipage 2\n{pagebreak}Multipage 3\n"
      @multipage.save
      @multipage.reload
    end

    describe "#find_page_by_path" do
      it "should return the home page when the path is empty" do
        Page.find_page_by_path([]).should eql(pages(:home))
      end

      it "should return the home page when passed 'home'" do
        Page.find_page_by_path(%w(home)).should eql(pages(:home))
      end

      it "should return the children pages of the home page" do
        Page.find_page_by_path(%w(second)).should eql(pages(:second_level))
      end

      it "should descend the path and find the correct page" do
        Page.find_page_by_path(%w(second third)).should eql(pages(:third_level))
        Page.find_page_by_path(%w(second third fourth)).should eql(pages(:fourth_level))
      end

      it "should verify the path is in the proper sequence" do
        Page.find_page_by_path(%w(fourth third second)).should be_nil
      end

      it "should handle corrupt paths gracefully" do
        Page.find_page_by_path([""]*4).should be_nil
        Page.find_page_by_path(['second', '', 'third']).should be_nil
        Page.find_page_by_path(['second', 'third', '']).should be_nil
      end
    end

    describe "handling leaves" do
      it "should return a page_body based on the page number at the end of the path" do
        @page = Page.find_page_by_path(%w(second third fourth 1))
        @page.should eql(pages(:fourth_level))
        @page.page_body.should eql("Multipage 1\n")
        @page.page_number.should eql(1)
        @page.pages.should eql(3)

        @page = Page.find_page_by_path(%w(second third fourth 2))
        @page.should eql(pages(:fourth_level))
        @page.page_body.should eql("Multipage 2\n")
        @page.page_number.should eql(2)
        @page.pages.should eql(3)

        @page = Page.find_page_by_path(%w(second third fourth 3))
        @page.should eql(pages(:fourth_level))
        @page.page_body.should eql("Multipage 3\n")
        @page.page_number.should eql(3)
        @page.pages.should eql(3)
      end

      it "should default to the first page" do
        @page = Page.find_page_by_path(%w(second third fourth))
        @page.should eql(pages(:fourth_level))
        @page.page_body.should eql("Multipage 1\n")
        @page.page_number.should eql(1)
        @page.pages.should eql(3)
      end

      it "should return nil when page number is out of bounds" do
        @page = Page.find_page_by_path(%w(second third fourth 0))
        @page.should be_nil
      end

      it "should return page with a nil page_body when it exceeds the maximum page number (DEPRECATION: This behavior needs to be changed)" do
        @page = Page.find_page_by_path(%w(second third fourth 5))
        @page.should eql(pages(:fourth_level))
        @page.page_body.should be_nil
        @page.page_number.should eql(5)
        @page.pages.should eql(3)
      end

      it "should descend and verify each path of the page" do
        Page.find_page_by_path(%w(second third 5 fourth)).should be_nil
        Page.find_page_by_path(%w(second third 5)).should be_nil
      end
    end
  end

  describe "handling multipages in non-leaf pages" do
    before(:each) do
      @multipage = pages(:third_level)
      @multipage.body = "Multipage 1\n{pagebreak}Multipage 2\n{pagebreak}Multipage 3\n"
      @multipage.save
      @multipage.reload
    end

    # Multipage in the middle of the path should be ignored
    describe "#find_page_by_path" do
      it "should return the home page when the path is empty" do
        Page.find_page_by_path([]).should eql(pages(:home))
      end

      it "should return the home page when passed 'home'" do
        Page.find_page_by_path(%w(home)).should eql(pages(:home))
      end

      it "should return the children pages of the home page" do
        Page.find_page_by_path(%w(second)).should eql(pages(:second_level))
      end

      it "should descend the path and find the correct page" do
        Page.find_page_by_path(%w(second third)).should eql(pages(:third_level))
        Page.find_page_by_path(%w(second third fourth)).should eql(pages(:fourth_level))
      end

      it "should verify the path is in the proper sequence" do
        Page.find_page_by_path(%w(fourth third second)).should be_nil
      end

      it "should handle corrupt paths gracefully" do
        Page.find_page_by_path([""]*4).should be_nil
        Page.find_page_by_path(['second', '', 'third']).should be_nil
        Page.find_page_by_path(['second', 'third', '']).should be_nil
      end
    end

    describe "handling in-line multipages" do
      it "should return a page_body based on the page number at the end of the path" do
        @page = Page.find_page_by_path(%w(second third 1))
        @page.should eql(pages(:third_level))
        @page.page_body.should eql("Multipage 1\n")
        @page.page_number.should eql(1)
        @page.pages.should eql(3)

        @page = Page.find_page_by_path(%w(second third 2))
        @page.should eql(pages(:third_level))
        @page.page_body.should eql("Multipage 2\n")
        @page.page_number.should eql(2)
        @page.pages.should eql(3)

        @page = Page.find_page_by_path(%w(second third 3))
        @page.should eql(pages(:third_level))
        @page.page_body.should eql("Multipage 3\n")
        @page.page_number.should eql(3)
        @page.pages.should eql(3)
      end

      it "should default to the first page" do
        @page = Page.find_page_by_path(%w(second third))
        @page.should eql(pages(:third_level))
        @page.page_body.should eql("Multipage 1\n")
        @page.page_number.should eql(1)
        @page.pages.should eql(3)
      end

      it "should return nil when page number is out of bounds" do
        @page = Page.find_page_by_path(%w(second third 0))
        @page.should be_nil
      end

      it "should return page with a nil page_body when it exceeds the maximum page number (DEPRECATION: This behavior needs to be changed)" do
        @page = Page.find_page_by_path(%w(second third 5))
        @page.should eql(pages(:third_level))
        @page.page_body.should be_nil
        @page.page_number.should eql(5)
        @page.pages.should eql(3)
      end

      it "should descend and verify each path of the page" do
        Page.find_page_by_path(%w(second third 5 fourth)).should be_nil
        Page.find_page_by_path(%w(second 5)).should be_nil
        Page.find_page_by_path(%w(2 second third)).should be_nil
        Page.find_page_by_path(%w(second third fourth)).should eql(pages(:fourth_level))
      end
    end
  
  end

  describe "handling multipages in non-leaf pages" do
    before(:each) do
      @multipage = pages(:home)
      @multipage.body = "Multipage 1\n{pagebreak}Multipage 2\n{pagebreak}Multipage 3\n"
      @multipage.save
      @multipage.reload
    end

    # Multipage in the middle of the path should be ignored
    describe "#find_page_by_path" do
      it "should return the home page when the path is empty" do
        Page.find_page_by_path([]).should eql(pages(:home))
      end

      it "should return the home page when passed 'home'" do
        Page.find_page_by_path(%w(home)).should eql(pages(:home))
      end

      it "should return the children pages of the home page" do
        Page.find_page_by_path(%w(second)).should eql(pages(:second_level))
      end

      it "should descend the path and find the correct page" do
        Page.find_page_by_path(%w(second third)).should eql(pages(:third_level))
        Page.find_page_by_path(%w(second third fourth)).should eql(pages(:fourth_level))
      end

      it "should verify the path is in the proper sequence" do
        Page.find_page_by_path(%w(fourth third second)).should be_nil
      end

      it "should handle corrupt paths gracefully" do
        Page.find_page_by_path([""]*4).should be_nil
        Page.find_page_by_path(['second', '', 'third']).should be_nil
        Page.find_page_by_path(['second', 'third', '']).should be_nil
      end
    end

    describe "handling home multipages" do
      it "should return a page_body based on the page number at the end of the path" do
        @page = Page.find_page_by_path(%w(1))
        @page.should eql(pages(:home))
        @page.page_body.should eql("Multipage 1\n")
        @page.page_number.should eql(1)
        @page.pages.should eql(3)

        @page = Page.find_page_by_path(%w(2))
        @page.should eql(pages(:home))
        @page.page_body.should eql("Multipage 2\n")
        @page.page_number.should eql(2)
        @page.pages.should eql(3)

        @page = Page.find_page_by_path(%w(3))
        @page.should eql(pages(:home))
        @page.page_body.should eql("Multipage 3\n")
        @page.page_number.should eql(3)
        @page.pages.should eql(3)
      end

      it "should default to the first page" do
        @page = Page.find_page_by_path([])
        @page.should eql(pages(:home))
        @page.page_body.should eql("Multipage 1\n")
        @page.page_number.should eql(1)
        @page.pages.should eql(3)
      end

      it "should return nil when page number is out of bounds" do
        @page = Page.find_page_by_path(%w(0))
        @page.should be_nil
      end

      it "should return page with a nil page_body when it exceeds the maximum page number (DEPRECATION: This behavior needs to be changed)" do
        @page = Page.find_page_by_path(%w(5))
        @page.should eql(pages(:home))
        @page.page_body.should be_nil
        @page.page_number.should eql(5)
        @page.pages.should eql(3)
      end

      it "should descend and verify each path of the page" do
        Page.find_page_by_path(%w(second third 5 fourth)).should be_nil
        Page.find_page_by_path(%w(second 5)).should be_nil
        Page.find_page_by_path(%w(2 second third)).should be_nil
        Page.find_page_by_path(%w(second third fourth)).should eql(pages(:fourth_level))
      end
    end

    it "should handle home/1, home/2, etc. pages"
  
  end

  describe "#find_child" do

    it "should find a child page by name" do
      # Since home and '' have funkiness, better test something from mid-level
      Page.find_by_name("second").find_child(pages(:third_level).name).should eql(pages(:third_level))
    end

    it "should find a child page of home despite the weird home alias" do
      Page.find_by_name("home").should eql(pages(:home))
      Page.find_by_name("home").find_child(pages(:second_level).name).should eql(pages(:second_level))
    end

    it "should return nil if it cannot find the child page by name" do
      Page.find_by_name("second").find_child(pages(:fourth_level).name).should be_nil
      # swap_test1 is in a different branch from second_level
      Page.find_by_name("second").find_child(pages(:swap_test1).name).should be_nil
    end

    it "should return nil if the child is unpublished" do
      pages(:unpublished).parent.should eql(pages(:second_level))
      Page.find_by_name("second").find_child(pages(:unpublished).name).should be_nil
    end
    
  end

  describe "#split_page!" do
    before(:each) do
      @page = Page.create(
        :name => 'test',
        :title => 'Test Page Type',
        :parent => pages(:second_level),
        :body => 'No multipage'
      )
      @page.reload
      @page.page_type.should eql("page")

      @page.update_attributes(:body => "Multipage 1\n{pagebreak}Multipage 2\n{pagebreak}Multipage 3\n")
      @page.reload
      # Must split pages, or page_number an pages will NOT be set
      @page.split_page!
    end

    it "should automatically detect {pagebreak} and convert the page to a multipage" do
      @page.page_type.should eql("multipage")
      @page.page_number.should eql(1)
    end

    it "should set page_number to 1 after converting a page to a multipage" do
      @page.page_number.should eql(1)
    end

    it "should set page body to the first page after converting a page to a multipage" do
      @page.page_body.should eql("Multipage 1\n")
    end

    it "should set pages after converting a page to a multipage" do
      @page.pages.should eql(3)
    end

    it "should accept a page number and set the appropriate multipage values" do
      1.upto(3) do |p|
        @page.split_page!(p)
        @page.page_number.should eql(p)
        @page.pages.should eql(3)
        @page.page_body.should eql("Multipage #{p}\n")
      end
    end

    it "should handle out-of-bound page splits gracefully" do
      [0, 5, 23].each do |p|
        @page.split_page!(p)
        @page.page_number.should eql(p)
        @page.pages.should eql(3)
        @page.page_body.should be_nil
      end
    end

    it "should handle non-multipage gracefully" do
      @page.update_attributes(:body => "Back to normal page")
      @page.reload

      @page.split_page!
      @page.page_number.should eql(1)
      @page.pages.should eql(1)
      @page.page_body.should eql(@page.body)
    end

  end

  describe "#swap!" do

    def check_page_order(*args)
      # Reset @siblings when this called
      @siblings = pages(:swap_test1).self_and_siblings
      @siblings.each_with_index do |page, i|
        page.should eql(pages("swap_test#{args[i]}"))
        # Page order is not recalculated, they are just swapped
        page.page_order.should eql(pages("swap_test#{i + 1}").page_order)
      end
    end

    before(:each) do
      # Check fixture integrity
      pages(:swap_test).should have(3).children
      @siblings = pages(:swap_test1).self_and_siblings
      @siblings.length.should eql(3)

      # Check siblings return correct page ordering
      check_page_order(1, 2, 3)
    end

    it "should ignore out-of-bound swaps" do
      # Swap 0 with -1
      @siblings[0].swap!(-1).should be_nil
      check_page_order(1, 2, 3)

      # Swap 2 with 3
      @siblings[2].swap!(1).should be_nil
      check_page_order(1, 2, 3)

      # Swap 1 with -1
      @siblings[1].swap!(-2).should be_nil
      check_page_order(1, 2, 3)

      # Swap 1 with 3
      @siblings[1].swap!(2).should be_nil
      check_page_order(1, 2, 3)
    end

    it "should swap a page with a number page relative to it in page order" do
      @siblings[0].swap!(1).should_not be_nil
      check_page_order(2, 1, 3)

      @siblings[1].swap!(1).should_not be_nil
      check_page_order(2, 3, 1)

      @siblings[1].swap!(-1).should_not be_nil
      check_page_order(3, 2, 1)

      @siblings[2].swap!(-2).should_not be_nil
      check_page_order(1, 2, 3)
    end


  end


end
