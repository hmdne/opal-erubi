require 'spec_helper'
require 'fixtures/simple'
require 'fixtures/advanced'
require 'fixtures/html_content'
#require 'fixtures/yielder'

describe "Erubi files" do
  let(:simple)            { Template['fixtures/simple'] }
  let(:advanced)          { Template['fixtures/advanced'] }
  let(:html_content)      { Template['fixtures/html_content'] }
  #let(:yielder)           { Template['fixtures/yielder'] }

  it "should be defined by filename on Template namespace" do
    expect(simple).to be_kind_of(Template)
  end

  it "should render using #render" do
    expect(simple.render(self).chomp).to eq('lol')
  end

  it "accepts a context to render template with" do
    @erubi_message = "hello world"
    expect(advanced.render(self).chomp).to include('hello world')
    expect(advanced.render(self).chomp).to eq(<<~EOF.chomp)
      hello world
      <a foo="123" bar="baz" quz="1134" href="#">
        foofoofoo
      </a>
    EOF
  end

  it "generates html with a given context" do
    @h1_content = 'Ford Perfect'
    expect(html_content.render(self).chomp).to eq('<h1>Ford Perfect</h1>')
  end

  # There are issues to be solved before such a syntax can be supported
  xit "yields a block" do
    out = yielder.render self do
      "<strong>Hello world!</strong>"
    end
    expect(out.chomp).to eq("<div>\n  <strong>Hello world!</strong>\n</div>")
  end
end
