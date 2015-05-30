require 'rails_helper'

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

  context "LINK BUTTONS" do

    describe "#link_button" do

      it "should get a bootstrap link button" do
        rspec = helper.link_button 'link-button', '/'
        expected = %Q(<a class=\"btn btn-default\" href=\"/\">link-button</a>)
        expect(rspec).to eq expected
      end

      it "should get a bootstrap link button with primary color" do
        rspec = helper.link_button 'link-button', '/', color: 'primary'
        expected = %Q(<a class=\"btn btn-primary\" href=\"/\">link-button</a>)
        expect(rspec).to eq expected
      end

      it "should get a bootstrap link button with small size" do
        rspec = helper.link_button 'link-button', '/', size: 'sm'
        expected = %Q(<a class=\"btn btn-default btn-sm\" href=\"/\">link-button</a>)
        expect(rspec).to eq expected
      end

      it "should get a bootstrap link button with block" do
        rspec = helper.link_button 'link-button', '/', block: true
        expected = %Q(<a class=\"btn btn-default btn-block\" href=\"/\">link-button</a>)
        expect(rspec).to eq expected
      end

      it "should get a bootstrap link button with active state" do
        rspec = helper.link_button 'link-button', '/', active: true
        expected = %Q(<a class=\"btn btn-default active\" href=\"/\">link-button</a>)
        expect(rspec).to eq expected
      end

      it "should get a bootstrap link button with disabled state" do
        rspec = helper.link_button 'link-button', '/', disabled: true
        expected = %Q(<a class=\"btn btn-default disabled\" href=\"/\">link-button</a>)
        expect(rspec).to eq expected
      end

      it "should get a bootstrap link button with preset class" do
        rspec = helper.link_button 'link-button', '/', class: 'preset_class preset_class_2'
        expected = %Q(<a class=\"btn btn-default preset_class preset_class_2\" href=\"/\">link-button</a>)
        expect(rspec).to eq expected
      end

      it "should get a bootstrap link button with label hidden" do
        rspec = helper.link_button 'link-button', '/', label_hidden: 'xs'
        expected = %Q(<a class=\"btn btn-default\" href=\"/\"><span class=\"hidden-xs\">link-button</span></a>)
        expect(rspec).to eq expected
      end

      it "should get a bootstrap link button with a fa icon" do
        rspec = helper.link_button 'link-button', '/', icon: 'user'
        expected = %Q(<a class=\"btn btn-default\" href=\"/\"><i class=\"fa fa-user\"></i> link-button</a>)
        expect(rspec).to eq expected
      end
    end

    describe "#new_button" do

      it "should get a bootstrap new button" do
        rspec = helper.new_button 'new-button', '/'
        expected = %Q(<a class=\"btn btn-primary\" href=\"/\"><i class=\"fa fa-plus\"></i> new-button</a>)
        expect(rspec).to eq expected
      end
    end

    describe "#show_button" do

      it "should get a bootstrap show button" do
        rspec = helper.show_button 'show-button', '/'
        expected = %Q(<a class=\"btn btn-info\" href=\"/\"><i class=\"fa fa-search\"></i> show-button</a>)
        expect(rspec).to eq expected
      end
    end

    describe "#edit_button" do

      it "should get a bootstrap edit button" do
        rspec = helper.edit_button 'edit-button', '/'
        expected = %Q(<a class=\"btn btn-warning\" href=\"/\"><i class=\"fa fa-edit\"></i> edit-button</a>)
        expect(rspec).to eq expected
      end
    end

    describe "#destroy_button" do

      it "should get a bootstrap destroy button" do
        rspec = helper.destroy_button 'destroy-button', '/'
        expected = %Q(<a class=\"btn btn-danger\" data-confirm=\"Are you sure?\" rel=\"nofollow\" data-method=\"delete\" href=\"/\"><i class=\"fa fa-trash\"></i> destroy-button</a>)
        expect(rspec).to eq expected
      end
    end

    describe "#back_button" do

      it "should get a bootstrap back button" do
        rspec = helper.back_button 'back-button', '/'
        expected = %Q(<a class=\"btn btn-default\" href=\"/\"><i class=\"fa fa-reply\"></i> back-button</a>)
        expect(rspec).to eq expected
      end
    end

    describe "#cancel_button" do

      it "should get a bootstrap cancel button" do
        rspec = helper.cancel_button 'cancel-button', '/'
        expected = %Q(<a class=\"btn btn-default\" href=\"/\"><i class=\"fa fa-ban\"></i> cancel-button</a>)
        expect(rspec).to eq expected
      end
    end
  end

  context "BUTTONS" do

    describe "#button" do

      it "should get a bootstrap button" do
        rspec = helper.button 'button'
        expected = %Q(<button name=\"button\" type=\"button\" class=\"btn btn-default\">button</button>)
        expect(rspec).to eq expected
      end

      it "should get a bootstrap button with primary color" do
        rspec = helper.button 'button', color: 'primary'
        expected = %Q(<button name=\"button\" type=\"button\" class=\"btn btn-primary\">button</button>)
        expect(rspec).to eq expected
      end

      it "should get a bootstrap button with small size" do
        rspec = helper.button 'button', size: 'sm'
        expected = %Q(<button name=\"button\" type=\"button\" class=\"btn btn-default btn-sm\">button</button>)
        expect(rspec).to eq expected
      end

      it "should get a bootstrap button with block" do
        rspec = helper.button 'button', block: true
        expected = %Q(<button name=\"button\" type=\"button\" class=\"btn btn-default btn-block\">button</button>)
        expect(rspec).to eq expected
      end

      it "should get a bootstrap button with active state" do
        rspec = helper.button 'button', active: true
        expected = %Q(<button name=\"button\" type=\"button\" class=\"btn btn-default active\">button</button>)
        expect(rspec).to eq expected
      end

      it "should get a bootstrap button with disabled state" do
        rspec = helper.button 'button', disabled: true
        expected = %Q(<button name=\"button\" type=\"button\" disabled=\"disabled\" class=\"btn btn-default\">button</button>)
        expect(rspec).to eq expected
      end

      it "should get a bootstrap button with preset class" do
        rspec = helper.button 'button', class: 'preset_class preset_class_2'
        expected = %Q(<button name=\"button\" type=\"button\" class=\"btn btn-default preset_class preset_class_2\">button</button>)
        expect(rspec).to eq expected
      end

      it "should get a bootstrap button with label hidden" do
        rspec = helper.button 'button', label_hidden: 'xs'
        expected = %Q(<button name=\"button\" type=\"button\" class=\"btn btn-default\"><span class=\"hidden-xs\">button</span></button>)
        expect(rspec).to eq expected
      end

      it "should get a bootstrap button with a fa icon" do
        rspec = helper.button 'button', icon: 'user'
        expected = %Q(<button name=\"button\" type=\"button\" class=\"btn btn-default\"><i class=\"fa fa-user\"></i> button</button>)
        expect(rspec).to eq expected
      end
    end

    describe "#submit_button" do

      it "should get a bootstrap submit button" do
        rspec = helper.submit_button 'submit-button'
        expected = %Q(<button name=\"submit\" type=\"submit\" class=\"btn btn-primary\"><i class=\"fa fa-check\"></i> submit-button</button>)
        expect(rspec).to eq expected
      end
    end

    describe "#reset_button" do

      it "should get a bootstrap reset button" do
        rspec = helper.reset_button 'reset-button'
        expected = %Q(<button name=\"reset\" type=\"reset\" class=\"btn btn-default\"><i class=\"fa fa-eraser\"></i> reset-button</button>)
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
