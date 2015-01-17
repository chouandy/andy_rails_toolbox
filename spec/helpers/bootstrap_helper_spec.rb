require "rails_helper"

RSpec.describe BootstrapHelper do

  context "ICONS" do

    describe "#bs_icon" do

      it "should get a bootstrap icon" do
        rspec = helper.bs_icon 'user'
        expected = %Q(<span class=\"glyphicon glyphicon-user\"></span>)
        expect(rspec).to eq expected
      end
    end
  end

  context "BUTTONS" do

    describe "#html_button" do

      it "should get a bootstrap html button" do
        rspec = helper.html_button 'button'
        expected = %Q(<button name=\"button\" type=\"button\" class=\"btn btn-default\">button</button>)
        expect(rspec).to eq expected
      end

      it "should get a bootstrap html button with primary color" do
        rspec = helper.html_button 'button', color: 'primary'
        expected = %Q(<button name=\"button\" type=\"button\" class=\"btn btn-primary\">button</button>)
        expect(rspec).to eq expected
      end

      it "should get a bootstrap html button with sm size" do
        rspec = helper.html_button 'button', size: 'sm'
        expected = %Q(<button name=\"button\" type=\"button\" class=\"btn btn-default btn-sm\">button</button>)
        expect(rspec).to eq expected
      end

      it "should get a bootstrap html button with block display" do
        rspec = helper.html_button 'button', block: true
        expected = %Q(<button name=\"button\" type=\"button\" class=\"btn btn-default btn-block\">button</button>)
        expect(rspec).to eq expected
      end

      it "should get a bootstrap html button with a fa_icon" do
        rspec = helper.html_button 'button', icon: 'user'
        expected = %Q(<button name=\"button\" type=\"button\" class=\"btn btn-default\"><i class=\"fa fa-user\"></i> button</button>)
        expect(rspec).to eq expected
      end

      it "should get a bootstrap active html button with a fa_icon" do
        rspec = helper.html_button 'button', active: true
        expected = %Q(<button name=\"button\" type=\"button\" class=\"btn btn-default active\">button</button>)
        expect(rspec).to eq expected
      end
    end

    describe "#submit_button" do

      it "should get a bootstrap submit button" do
        rspec = helper.submit_button 'submit'
        expected = %Q(<button type=\"submit\" class=\"btn btn-default\">submit</button>)
        expect(rspec).to eq expected
      end
    end

    describe "#reset_button" do

      it "should get a bootstrap reset button" do
        rspec = helper.reset_button 'reset'
        expected = %Q(<button type=\"reset\" class=\"btn btn-default\">reset</button>)
        expect(rspec).to eq expected
      end
    end

    describe "#link_button" do

      it "should get a bootstrap link button" do
        rspec = helper.link_button 'link', url: root_path
        expected = %Q(<a class=\"btn btn-default\" role=\"button\" href=\"/\">link</a>)
        expect(rspec).to eq expected
      end
    end

    describe "#input_button" do

      it "should get a bootstrap input button" do
        rspec = helper.input_button 'input button'
        expected = %Q(<input class=\"btn btn-default\" value=\"input button\" type=\"button\" />)
        expect(rspec).to eq expected
      end
    end

    describe "#input_submit" do

      it "should get a bootstrap input submit" do
        rspec = helper.input_submit 'input button'
        expected = %Q(<input type=\"submit\" name=\"commit\" value=\"input button\" class=\"btn btn-default\" />)
        expect(rspec).to eq expected
      end
    end
  end

  context "IMAGES" do

    describe "#image_responsive" do

      it "should get a bootstrap responsive-friendly image tag" do
        rspec = helper.image_responsive 'pic.png'
        expected = %Q(<img class=\"img-responsive\" src=\"/images/pic.png\" alt=\"Pic\" />)
        expect(rspec).to eq expected
      end
    end

    describe "#image_rounded" do

      it "should get an image tag with rounded corners" do
        rspec = helper.image_rounded 'pic.png'
        expected = %Q(<img class=\"img-rounded\" src=\"/images/pic.png\" alt=\"Pic\" />)
        expect(rspec).to eq expected
      end
    end

    describe "#image_circle" do

      it "should get an image tag with circle" do
        rspec = helper.image_circle 'pic.png'
        expected = %Q(<img class=\"img-circle\" src=\"/images/pic.png\" alt=\"Pic\" />)
        expect(rspec).to eq expected
      end
    end

    describe "#image_thumbnail" do

      it "should get an image tag within thumbnail" do
        rspec = helper.image_thumbnail 'pic.png'
        expected = %Q(<img class=\"img-thumbnail\" src=\"/images/pic.png\" alt=\"Pic\" />)
        expect(rspec).to eq expected
      end
    end
  end
end
