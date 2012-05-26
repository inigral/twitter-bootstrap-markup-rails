require 'spec_helper'

describe ThumbnailHelper do
  include BootstrapSpecHelper

  before do
    @output_buffer = ''
  end

  it 'should have class thumbnail' do
    concat bootstrap_thumbnail("imgs/img_url")
    @output_buffer.should have_tag("a.thumbnail")
  end

  it 'has an image url' do
    concat bootstrap_thumbnail("imgs/img_url")
    @output_buffer.should have_tag("img[src=imgs/img_url]"
  end

  it 'should have alt text if provided' do
    concat bootstrap_thumbnail("imgs/img_url", { :alt => 'alt_text' })
    @output_buffer.should have_tag("img[alt=alt_text]")
  end

  it 'shows a message if one is provided' do
    concat bootstrap_thumbnail("imgs/img_url", { :message => "Message" })
    @output_buffer.should have_tag("div", /Message/)
  end

  it 'shows a heading if one is provided' do
    concat bootstrap_thumbnail("imgs/img_url", { :heading => "Heading" })
    @output_buffer.should have_tag("h5", /Heading/)
  end

  it 'should have div tag if content is provided' do
    concat bootstrap_thumbnail("imgs/img_url", { :heading => "Hello World" })
    @output_buffer.should have_tag("div.thumbnail")
  end
end
