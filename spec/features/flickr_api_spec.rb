require 'rails_helper'

describe FlickrPhotos do
  describe 'training without cards' do
    let(:response) do
      { "photos": { "page": 1, "pages": 10, "perpage": 10, "total": "100",
   "photo": [
     { "id": "11111111111", "owner": "9100000@N00", "secret": "aaaaaaaaa", "server": "257", "farm": 1, "title": "Lesson 1", "ispublic": 1, "isfriend": 0, "isfamily": 0 },
     { "id": "00000000000", "owner": "9100000@N00", "secret": "bbbbbbbbb", "server": "7411", "farm": 8, "title": "Lesson 2", "ispublic": 1, "isfriend": 0, "isfamily": 0 },
     { "id": "22222222222", "owner": "9100000@N00", "secret": "ccccccccc", "server": "8650", "farm": 9, "title": "Lesson 3", "ispublic": 1, "isfriend": 0, "isfamily": 0 },
     { "id": "33333333333", "owner": "9100000@N00", "secret": "ddddddddd", "server": "8569", "farm": 9, "title": "Lesson 4", "ispublic": 1, "isfriend": 0, "isfamily": 0 },
     { "id": "44444444444", "owner": "9100000@N00", "secret": "eeeeeeeee", "server": "5586", "farm": 6, "title": "Lesson 5", "ispublic": 1, "isfriend": 0, "isfamily": 0 },
     { "id": "55555555555", "owner": "9100000@N00", "secret": "fffffffff", "server": "3871", "farm": 4, "title": "Lesson 6", "ispublic": 1, "isfriend": 0, "isfamily": 0 },
     { "id": "66666666666", "owner": "9100000@N00", "secret": "ggggggggg", "server": "2905", "farm": 3, "title": "Lesson 7", "ispublic": 1, "isfriend": 0, "isfamily": 0 },
     { "id": "77777777777", "owner": "9100000@N00", "secret": "hhhhhhhhh", "server": "2816", "farm": 3, "title": "Lesson 8", "ispublic": 1, "isfriend": 0, "isfamily": 0 },
     { "id": "88888888888", "owner": "9100000@N00", "secret": "iiiiiiiii", "server": "7373", "farm": 8, "title": "Lesson 9", "ispublic": 1, "isfriend": 0, "isfamily": 0 },
     { "id": "99999999999", "owner": "9100000@N00", "secret": "jjjjjjjjj", "server": "2835", "farm": 3, "title": "Lesson 10", "ispublic": 1, "isfriend": 0, "isfamily": 0 }
   ] }, "stat": "ok" }.to_json
    end

    before do
      stub_request(:get, /api.flickr.com/).to_return(body: response)
    end
    it 'will return image url' do
      request = FlickrPhotos.flickr('lesson')
      expect(request).to be_instance_of(Array)
      expect(request.length).to eq 10
    end
  end
end
