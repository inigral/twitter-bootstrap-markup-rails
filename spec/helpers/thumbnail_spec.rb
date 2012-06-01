require 'spec_helper'

describe ThumbnailHelper do
  include BootstrapSpecHelper

  before do
    @output_buffer = ''
  end

  describe '#bootstrap_thumbnail' do
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
      @output_buffer.should have_tag("p", /Message/)
    end

    it 'shows a heading if one is provided' do
      concat bootstrap_thumbnail("imgs/img_url", { :heading => "Heading" })
      @output_buffer.should have_tag("h5", /Heading/)
    end

    it 'should have div tag if content is provided' do
      concat bootstrap_thumbnail("imgs/img_url", { :heading => "Hello World" })
      @output_buffer.should have_tag("div.thumbnail")
    end

    it 'should be a link if no caption is provided' do
      concat boostrap_thumbnail('imgs/img_url', { :link => '#' })
      @output_buffer.should have_tag("a[href=#]")
    end
  end

  describe '#bootstrap_thumbnail_list' do

    it 'should have class thumbnails' do
      concat bootstrap_thumbnail_list do |t|
               t.bootstrap_thumbnail "imgs/fluffy_cat.jpg"
               t.bootstrap_thumbnail "imgs/scruffy_cat.jpg"
             end

      @output_buffer.should have_tag('ul.thumbnails')
    end

    it 'should have a list with a span class on each element' do
      concat bootstrap_thumbnail_list do |t|
               t.bootstrap_thumbnail "imgs/fluffy_cat.jpg"
               t.bootstrap_thumbnail "imgs/scruffy_cat.jpg"
               t.bootstrap_thumbnail "imgs/snuffy_cat.jpg"
             end

      3.times do |i|
        @output_buffer.should have_tag("li:nth-of-type(#{i})", :class => "span12")
      end
    end

    it 'should have the correct number of elements' do
      concat bootstrap_thumbnail_list do |t|
               t.bootstrap_thumbnail "imgs/fluffy_cat.jpg"
               t.bootstrap_thumbnail "imgs/scruffy_cat.jpg"
             end

      @output_buffer.should have_tag("ul:first-child", "img[src='imgs/fluffy_cat.jpg']")
      @output_buffer.should have_tag("ul:last-child", "img[src='imgs/scruffy_cat.jpg']")
    end

    it 'should only have thumbnail elements' do
      concat bootstrap_thumbnail_list do |t|
               t.bootstrap_thumbnail "imgs/fluffy_cat.jpg"
               t.bootstrap_thumbnail "imgs/scruffy_cat.jpg"
             end
      @output_buffer.should have_tag("img[src='imgs/fluffy_cat.jpg']")
      @output_buffer.should have_tag("img[src='imgs/scruffy_cat.jpg']")
    end
  end
end
