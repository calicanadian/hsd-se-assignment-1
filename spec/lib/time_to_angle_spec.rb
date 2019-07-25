require 'rails_helper'
require 'stringio'

def get_time_input(time)
  $stdin.gets.chomp
end

describe 'TimeToAngle' do
  before do
    # allow($stout).to receive(:write)
  end

  after do
    $stdin = STDIN
  end

  context 'happy path' do
    it 'should take 9 and return 90' do
      time_strings = ["9:00 PM","9:00PM","9:00 pm","9:00 AM","9:00AM","9:00 am","9:00am","9:00","9"]
      time_strings.each do |string|
        require 'time-to-angle.rb'
        expect(prepare_time_string("#{string}\n")).to eq(90)
      end
    end

    it 'should take 3 and return 90' do
      time_strings = ["3:00 PM","3:00PM","3:00 pm","3:00 AM","3:00AM","3:00 am","3:00am","3:00","3"]
      time_strings.each do |string|
        require 'time-to-angle.rb'
        expect(prepare_time_string("#{string}\n")).to eq(90)
      end
    end

    it 'should take 6 and return 180' do
      time_strings = ["6:00 PM","6:00PM","6:00 pm","6:00 AM","6:00AM","6:00 am","6:00am","6:00","6"]
      time_strings.each do |string|
        require 'time-to-angle.rb'
        expect(prepare_time_string("#{string}\n")).to eq(180)
      end
    end

    it 'should take 12 and return 0' do
      time_strings = ["12:00 PM","12:00PM","12:00 pm","12:00 AM","12:00AM","12:00 am","12:00am","12:00","12"]
      time_strings.each do |string|
        require 'time-to-angle.rb'
        expect(prepare_time_string("#{string}\n")).to eq(0)
      end
    end

    it 'should take 15 and return 90' do
      time_strings = ["15:00","15"]
      time_strings.each do |string|
        require 'time-to-angle.rb'
        expect(prepare_time_string("#{string}\n")).to eq(90)
      end
    end

    it 'should take 18 and return 180' do
      time_strings = ["18:00","18"]
      time_strings.each do |string|
        require 'time-to-angle.rb'
        expect(prepare_time_string("#{string}\n")).to eq(180)
      end
    end

    it 'should take 21 and return 90' do
      time_strings = ["21:00","21"]
      time_strings.each do |string|
        require 'time-to-angle.rb'
        expect(prepare_time_string("#{string}\n")).to eq(90)
      end
    end

    it 'should take 24 and return 0' do
      time_strings = ["24:00","24"]
      time_strings.each do |string|
        require 'time-to-angle.rb'
        expect(prepare_time_string("#{string}\n")).to eq(0)
      end
    end
  end

  context 'unhappy path' do
    it 'should take 25 and return 30' do
      time_strings = ["25:00","25"]
      time_strings.each do |string|
        require 'time-to-angle.rb'
        expect(prepare_time_string("#{string}\n")).to eq(30)
      end
    end

    it 'should take a blank and return 0' do
      time_strings = [" ",""]
      time_strings.each do |string|
        require 'time-to-angle.rb'
        expect(prepare_time_string("#{string}\n")).to eq(0)
      end
    end

    it 'should take a 00:90 and return 180' do
      time_strings = ["00:90","0:90"]
      time_strings.each do |string|
        require 'time-to-angle.rb'
        expect(prepare_time_string("#{string}\n")).to eq(180)
      end
    end

    it 'should take a 00:900 and return 0' do
      time_strings = ["00:900","0:900"]
      time_strings.each do |string|
        require 'time-to-angle.rb'
        expect(prepare_time_string("#{string}\n")).to eq(0)
      end
    end
  end

end
