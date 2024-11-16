import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pixster/features/Home/data/pixaby_api_repo.dart';
import 'package:pixster/features/Home/domain/photo.dart';

class MockHttpClient extends Mock implements Client {}

final String _apiKey =
    "2AB3WsUO4SkAN2Zf6DbhwSXxhtCiYxEuQKMQiDIHu8VDKFxbGHIt0U5g";
// Define the API endpoint
final uri = Uri.parse("https://api.pexels.com/v1/search?query=popular");

// Define headers for authentication
final headers = {"Authorization": _apiKey};
void main() {
  group(
    "Pixaby api reop test",
    () {
      late PixabyApiRepo pixabyApiRepo;
      late MockHttpClient mockHttpClient;
      setUp(
        () {
          mockHttpClient = MockHttpClient();
          pixabyApiRepo = PixabyApiRepo(client: mockHttpClient);
        },
      );
      //Get trending images function
      group(
        "getTrendingImages function",
        () {
          //status code is 200
          test(
            'given a funtion when fetch images if status code is 200',
            () {
              //assing
              when(
                () => mockHttpClient.get(uri, headers: headers),
              ).thenAnswer(
                (invocation) async {
                  return Response('''
                  {
    
    "photos": [
        {
            "id": 2568539,
            "width": 2624,
            "height": 3936,
            "url": "https://www.pexels.com/photo/red-ferrari-car-2568539/",
            "photographer": "Zachary DeBottis",
            "photographer_url": "https://www.pexels.com/@zachtheshoota",
            "photographer_id": 861258,
            "avg_color": "#746269",
            "src": {
                "original": "https://images.pexels.com/photos/2568539/pexels-photo-2568539.jpeg",
                "large2x": "https://images.pexels.com/photos/2568539/pexels-photo-2568539.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                "large": "https://images.pexels.com/photos/2568539/pexels-photo-2568539.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
                "medium": "https://images.pexels.com/photos/2568539/pexels-photo-2568539.jpeg?auto=compress&cs=tinysrgb&h=350",
                "small": "https://images.pexels.com/photos/2568539/pexels-photo-2568539.jpeg?auto=compress&cs=tinysrgb&h=130",
                "portrait": "https://images.pexels.com/photos/2568539/pexels-photo-2568539.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
                "landscape": "https://images.pexels.com/photos/2568539/pexels-photo-2568539.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
                "tiny": "https://images.pexels.com/photos/2568539/pexels-photo-2568539.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
            },
            "liked": false,
            "alt": "Detailed close-up of a red luxury sports car featuring rain droplets and emblem, evoking speed and elegance."
        },
        {
            "id": 2953898,
            "width": 3949,
            "height": 5923,
            "url": "https://www.pexels.com/photo/person-going-through-a-broken-wire-fence-2953898/",
            "photographer": "Zachary DeBottis",
            "photographer_url": "https://www.pexels.com/@zachtheshoota",
            "photographer_id": 861258,
            "avg_color": "#595B58",
            "src": {
                "original": "https://images.pexels.com/photos/2953898/pexels-photo-2953898.jpeg",
                "large2x": "https://images.pexels.com/photos/2953898/pexels-photo-2953898.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                "large": "https://images.pexels.com/photos/2953898/pexels-photo-2953898.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
                "medium": "https://images.pexels.com/photos/2953898/pexels-photo-2953898.jpeg?auto=compress&cs=tinysrgb&h=350",
                "small": "https://images.pexels.com/photos/2953898/pexels-photo-2953898.jpeg?auto=compress&cs=tinysrgb&h=130",
                "portrait": "https://images.pexels.com/photos/2953898/pexels-photo-2953898.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
                "landscape": "https://images.pexels.com/photos/2953898/pexels-photo-2953898.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
                "tiny": "https://images.pexels.com/photos/2953898/pexels-photo-2953898.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
            },
            "liked": false,
            "alt": "A person exploring an abandoned area through a broken chain link fence."
        },
        {
            "id": 2953878,
            "width": 3715,
            "height": 2972,
            "url": "https://www.pexels.com/photo/scenic-view-of-a-waterfalls-surrounded-by-trees-2953878/",
            "photographer": "Zachary DeBottis",
            "photographer_url": "https://www.pexels.com/@zachtheshoota",
            "photographer_id": 861258,
            "avg_color": "#64726E",
            "src": {
                "original": "https://images.pexels.com/photos/2953878/pexels-photo-2953878.jpeg",
                "large2x": "https://images.pexels.com/photos/2953878/pexels-photo-2953878.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                "large": "https://images.pexels.com/photos/2953878/pexels-photo-2953878.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
                "medium": "https://images.pexels.com/photos/2953878/pexels-photo-2953878.jpeg?auto=compress&cs=tinysrgb&h=350",
                "small": "https://images.pexels.com/photos/2953878/pexels-photo-2953878.jpeg?auto=compress&cs=tinysrgb&h=130",
                "portrait": "https://images.pexels.com/photos/2953878/pexels-photo-2953878.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
                "landscape": "https://images.pexels.com/photos/2953878/pexels-photo-2953878.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
                "tiny": "https://images.pexels.com/photos/2953878/pexels-photo-2953878.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
            },
            "liked": false,
            "alt": "A breathtaking aerial shot of a waterfall surrounded by a dense, green forest."
        },
        {
            "id": 29399449,
            "width": 6181,
            "height": 3477,
            "url": "https://www.pexels.com/photo/scenic-aerial-view-of-balos-lagoon-in-crete-29399449/",
            "photographer": "Dzmitry Charnou",
            "photographer_url": "https://www.pexels.com/@dzmitry-charnou-2093191166",
            "photographer_id": 2093191166,
            "avg_color": "#4E91A4",
            "src": {
                "original": "https://images.pexels.com/photos/29399449/pexels-photo-29399449.jpeg",
                "large2x": "https://images.pexels.com/photos/29399449/pexels-photo-29399449.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                "large": "https://images.pexels.com/photos/29399449/pexels-photo-29399449.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
                "medium": "https://images.pexels.com/photos/29399449/pexels-photo-29399449.jpeg?auto=compress&cs=tinysrgb&h=350",
                "small": "https://images.pexels.com/photos/29399449/pexels-photo-29399449.jpeg?auto=compress&cs=tinysrgb&h=130",
                "portrait": "https://images.pexels.com/photos/29399449/pexels-photo-29399449.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
                "landscape": "https://images.pexels.com/photos/29399449/pexels-photo-29399449.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
                "tiny": "https://images.pexels.com/photos/29399449/pexels-photo-29399449.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
            },
            "liked": false,
            "alt": "A stunning aerial capture of Balos Lagoon in Crete, showcasing turquoise waters and a rocky island."
        },
        {
            "id": 2568538,
            "width": 2449,
            "height": 3884,
            "url": "https://www.pexels.com/photo/black-and-red-ferrari-engine-2568538/",
            "photographer": "Zachary DeBottis",
            "photographer_url": "https://www.pexels.com/@zachtheshoota",
            "photographer_id": 861258,
            "avg_color": "#333034",
            "src": {
                "original": "https://images.pexels.com/photos/2568538/pexels-photo-2568538.jpeg",
                "large2x": "https://images.pexels.com/photos/2568538/pexels-photo-2568538.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                "large": "https://images.pexels.com/photos/2568538/pexels-photo-2568538.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
                "medium": "https://images.pexels.com/photos/2568538/pexels-photo-2568538.jpeg?auto=compress&cs=tinysrgb&h=350",
                "small": "https://images.pexels.com/photos/2568538/pexels-photo-2568538.jpeg?auto=compress&cs=tinysrgb&h=130",
                "portrait": "https://images.pexels.com/photos/2568538/pexels-photo-2568538.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
                "landscape": "https://images.pexels.com/photos/2568538/pexels-photo-2568538.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
                "tiny": "https://images.pexels.com/photos/2568538/pexels-photo-2568538.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
            },
            "liked": false,
            "alt": "Focused view of a red Ferrari engine showcasing automotive engineering and power."
        },
        {
            "id": 3810915,
            "width": 3456,
            "height": 4608,
            "url": "https://www.pexels.com/photo/photo-of-monumental-sculpture-3810915/",
            "photographer": "Spoortesh Honey",
            "photographer_url": "https://www.pexels.com/@spoortesh-honey",
            "photographer_id": 763579,
            "avg_color": "#A4A7A4",
            "src": {
                "original": "https://images.pexels.com/photos/3810915/pexels-photo-3810915.jpeg",
                "large2x": "https://images.pexels.com/photos/3810915/pexels-photo-3810915.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                "large": "https://images.pexels.com/photos/3810915/pexels-photo-3810915.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
                "medium": "https://images.pexels.com/photos/3810915/pexels-photo-3810915.jpeg?auto=compress&cs=tinysrgb&h=350",
                "small": "https://images.pexels.com/photos/3810915/pexels-photo-3810915.jpeg?auto=compress&cs=tinysrgb&h=130",
                "portrait": "https://images.pexels.com/photos/3810915/pexels-photo-3810915.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
                "landscape": "https://images.pexels.com/photos/3810915/pexels-photo-3810915.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
                "tiny": "https://images.pexels.com/photos/3810915/pexels-photo-3810915.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
            },
            "liked": false,
            "alt": "A grand statue of Shiva at Murudeshwar Temple, showcasing intricate artistry."
        },
        {
            "id": 825430,
            "width": 5458,
            "height": 3775,
            "url": "https://www.pexels.com/photo/gray-metal-statue-of-man-raising-hand-near-dock-825430/",
            "photographer": "Andrea Piacquadio",
            "photographer_url": "https://www.pexels.com/@olly",
            "photographer_id": 224453,
            "avg_color": "#BACADE",
            "src": {
                "original": "https://images.pexels.com/photos/825430/pexels-photo-825430.jpeg",
                "large2x": "https://images.pexels.com/photos/825430/pexels-photo-825430.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                "large": "https://images.pexels.com/photos/825430/pexels-photo-825430.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
                "medium": "https://images.pexels.com/photos/825430/pexels-photo-825430.jpeg?auto=compress&cs=tinysrgb&h=350",
                "small": "https://images.pexels.com/photos/825430/pexels-photo-825430.jpeg?auto=compress&cs=tinysrgb&h=130",
                "portrait": "https://images.pexels.com/photos/825430/pexels-photo-825430.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
                "landscape": "https://images.pexels.com/photos/825430/pexels-photo-825430.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
                "tiny": "https://images.pexels.com/photos/825430/pexels-photo-825430.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
            },
            "liked": false,
            "alt": "Iconic Freddie Mercury statue on Lake Geneva in Montreux, captured in a serene and foggy morning."
        },
        {
            "id": 29385733,
            "width": 4000,
            "height": 6000,
            "url": "https://www.pexels.com/photo/stunning-sunset-over-istanbul-s-galata-bridge-29385733/",
            "photographer": "Abdullah Al Mallah",
            "photographer_url": "https://www.pexels.com/@abdullahalmallah",
            "photographer_id": 25132544,
            "avg_color": "#34332F",
            "src": {
                "original": "https://images.pexels.com/photos/29385733/pexels-photo-29385733.jpeg",
                "large2x": "https://images.pexels.com/photos/29385733/pexels-photo-29385733.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                "large": "https://images.pexels.com/photos/29385733/pexels-photo-29385733.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
                "medium": "https://images.pexels.com/photos/29385733/pexels-photo-29385733.jpeg?auto=compress&cs=tinysrgb&h=350",
                "small": "https://images.pexels.com/photos/29385733/pexels-photo-29385733.jpeg?auto=compress&cs=tinysrgb&h=130",
                "portrait": "https://images.pexels.com/photos/29385733/pexels-photo-29385733.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
                "landscape": "https://images.pexels.com/photos/29385733/pexels-photo-29385733.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
                "tiny": "https://images.pexels.com/photos/29385733/pexels-photo-29385733.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
            },
            "liked": false,
            "alt": "Free stock photo of a light, beautiful sunset, galata bridge"
        },
        {
            "id": 29370932,
            "width": 3648,
            "height": 5472,
            "url": "https://www.pexels.com/photo/portrait-against-brandenburg-gate-in-berlin-29370932/",
            "photographer": "Eddson Lens",
            "photographer_url": "https://www.pexels.com/@eddson-lens-748406628",
            "photographer_id": 748406628,
            "avg_color": "#8E8D93",
            "src": {
                "original": "https://images.pexels.com/photos/29370932/pexels-photo-29370932.jpeg",
                "large2x": "https://images.pexels.com/photos/29370932/pexels-photo-29370932.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                "large": "https://images.pexels.com/photos/29370932/pexels-photo-29370932.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
                "medium": "https://images.pexels.com/photos/29370932/pexels-photo-29370932.jpeg?auto=compress&cs=tinysrgb&h=350",
                "small": "https://images.pexels.com/photos/29370932/pexels-photo-29370932.jpeg?auto=compress&cs=tinysrgb&h=130",
                "portrait": "https://images.pexels.com/photos/29370932/pexels-photo-29370932.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
                "landscape": "https://images.pexels.com/photos/29370932/pexels-photo-29370932.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
                "tiny": "https://images.pexels.com/photos/29370932/pexels-photo-29370932.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
            },
            "liked": false,
            "alt": "A man poses in front of the iconic Brandenburg Gate in Berlin, Germany."
        },
        {
            "id": 29365628,
            "width": 6016,
            "height": 4016,
            "url": "https://www.pexels.com/photo/iconic-view-of-tower-bridge-in-london-29365628/",
            "photographer": "Timberly Hawkins",
            "photographer_url": "https://www.pexels.com/@timberly-hawkins-157463692",
            "photographer_id": 157463692,
            "avg_color": "#8F928B",
            "src": {
                "original": "https://images.pexels.com/photos/29365628/pexels-photo-29365628.jpeg",
                "large2x": "https://images.pexels.com/photos/29365628/pexels-photo-29365628.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                "large": "https://images.pexels.com/photos/29365628/pexels-photo-29365628.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
                "medium": "https://images.pexels.com/photos/29365628/pexels-photo-29365628.jpeg?auto=compress&cs=tinysrgb&h=350",
                "small": "https://images.pexels.com/photos/29365628/pexels-photo-29365628.jpeg?auto=compress&cs=tinysrgb&h=130",
                "portrait": "https://images.pexels.com/photos/29365628/pexels-photo-29365628.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
                "landscape": "https://images.pexels.com/photos/29365628/pexels-photo-29365628.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
                "tiny": "https://images.pexels.com/photos/29365628/pexels-photo-29365628.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
            },
            "liked": false,
            "alt": ""
        },
        {
            "id": 2694434,
            "width": 6000,
            "height": 4000,
            "url": "https://www.pexels.com/photo/heart-and-zero-neon-light-signage-2694434/",
            "photographer": "Prateek Katyal",
            "photographer_url": "https://www.pexels.com/@prateekkatyal",
            "photographer_id": 1395826,
            "avg_color": "#130909",
            "src": {
                "original": "https://images.pexels.com/photos/2694434/pexels-photo-2694434.jpeg",
                "large2x": "https://images.pexels.com/photos/2694434/pexels-photo-2694434.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                "large": "https://images.pexels.com/photos/2694434/pexels-photo-2694434.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
                "medium": "https://images.pexels.com/photos/2694434/pexels-photo-2694434.jpeg?auto=compress&cs=tinysrgb&h=350",
                "small": "https://images.pexels.com/photos/2694434/pexels-photo-2694434.jpeg?auto=compress&cs=tinysrgb&h=130",
                "portrait": "https://images.pexels.com/photos/2694434/pexels-photo-2694434.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
                "landscape": "https://images.pexels.com/photos/2694434/pexels-photo-2694434.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
                "tiny": "https://images.pexels.com/photos/2694434/pexels-photo-2694434.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
            },
            "liked": false,
            "alt": "Bright neon heart icon with zero likes, symbolizing social media engagement."
        },
        {
            "id": 27677799,
            "width": 4000,
            "height": 6000,
            "url": "https://www.pexels.com/photo/woman-standing-in-tights-and-with-bag-27677799/",
            "photographer": "Bahadır  Aydın",
            "photographer_url": "https://www.pexels.com/@bahadir-aydin-1632708859",
            "photographer_id": 1632708859,
            "avg_color": "#9D908A",
            "src": {
                "original": "https://images.pexels.com/photos/27677799/pexels-photo-27677799.jpeg",
                "large2x": "https://images.pexels.com/photos/27677799/pexels-photo-27677799.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                "large": "https://images.pexels.com/photos/27677799/pexels-photo-27677799.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
                "medium": "https://images.pexels.com/photos/27677799/pexels-photo-27677799.jpeg?auto=compress&cs=tinysrgb&h=350",
                "small": "https://images.pexels.com/photos/27677799/pexels-photo-27677799.jpeg?auto=compress&cs=tinysrgb&h=130",
                "portrait": "https://images.pexels.com/photos/27677799/pexels-photo-27677799.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
                "landscape": "https://images.pexels.com/photos/27677799/pexels-photo-27677799.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
                "tiny": "https://images.pexels.com/photos/27677799/pexels-photo-27677799.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
            },
            "liked": false,
            "alt": "Stylish woman in urban setting showcasing high fashion with designer handbag and chic attire."
        },
        {
            "id": 26836623,
            "width": 3591,
            "height": 5386,
            "url": "https://www.pexels.com/photo/woman-in-cap-sitting-and-holding-bag-26836623/",
            "photographer": "Heber  Vazquez",
            "photographer_url": "https://www.pexels.com/@unpoquitodefoto",
            "photographer_id": 227263122,
            "avg_color": "#BDB7AB",
            "src": {
                "original": "https://images.pexels.com/photos/26836623/pexels-photo-26836623.jpeg",
                "large2x": "https://images.pexels.com/photos/26836623/pexels-photo-26836623.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                "large": "https://images.pexels.com/photos/26836623/pexels-photo-26836623.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
                "medium": "https://images.pexels.com/photos/26836623/pexels-photo-26836623.jpeg?auto=compress&cs=tinysrgb&h=350",
                "small": "https://images.pexels.com/photos/26836623/pexels-photo-26836623.jpeg?auto=compress&cs=tinysrgb&h=130",
                "portrait": "https://images.pexels.com/photos/26836623/pexels-photo-26836623.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
                "landscape": "https://images.pexels.com/photos/26836623/pexels-photo-26836623.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
                "tiny": "https://images.pexels.com/photos/26836623/pexels-photo-26836623.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
            },
            "liked": false,
            "alt": "Woman in Cap Sitting and Holding Bag"
        },
        {
            "id": 20395259,
            "width": 9504,
            "height": 6336,
            "url": "https://www.pexels.com/photo/hamburger-and-fries-on-plate-20395259/",
            "photographer": "Jack Baghel",
            "photographer_url": "https://www.pexels.com/@jack-baghel-2199968",
            "photographer_id": 2199968,
            "avg_color": "#8A8076",
            "src": {
                "original": "https://images.pexels.com/photos/20395259/pexels-photo-20395259.jpeg",
                "large2x": "https://images.pexels.com/photos/20395259/pexels-photo-20395259.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                "large": "https://images.pexels.com/photos/20395259/pexels-photo-20395259.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
                "medium": "https://images.pexels.com/photos/20395259/pexels-photo-20395259.jpeg?auto=compress&cs=tinysrgb&h=350",
                "small": "https://images.pexels.com/photos/20395259/pexels-photo-20395259.jpeg?auto=compress&cs=tinysrgb&h=130",
                "portrait": "https://images.pexels.com/photos/20395259/pexels-photo-20395259.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
                "landscape": "https://images.pexels.com/photos/20395259/pexels-photo-20395259.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
                "tiny": "https://images.pexels.com/photos/20395259/pexels-photo-20395259.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
            },
            "liked": false,
            "alt": "Appetizing hamburger with fries and ketchup on a white plate. Ideal for food photography."
        },
        {
            "id": 19089245,
            "width": 4072,
            "height": 5528,
            "url": "https://www.pexels.com/photo/deniz-mall-in-baku-at-dusk-19089245/",
            "photographer": "Elqiyar Rehimov",
            "photographer_url": "https://www.pexels.com/@elqiyar-rehimov-725733763",
            "photographer_id": 725733763,
            "avg_color": "#A7978A",
            "src": {
                "original": "https://images.pexels.com/photos/19089245/pexels-photo-19089245.jpeg",
                "large2x": "https://images.pexels.com/photos/19089245/pexels-photo-19089245.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                "large": "https://images.pexels.com/photos/19089245/pexels-photo-19089245.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
                "medium": "https://images.pexels.com/photos/19089245/pexels-photo-19089245.jpeg?auto=compress&cs=tinysrgb&h=350",
                "small": "https://images.pexels.com/photos/19089245/pexels-photo-19089245.jpeg?auto=compress&cs=tinysrgb&h=130",
                "portrait": "https://images.pexels.com/photos/19089245/pexels-photo-19089245.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
                "landscape": "https://images.pexels.com/photos/19089245/pexels-photo-19089245.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
                "tiny": "https://images.pexels.com/photos/19089245/pexels-photo-19089245.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
            },
            "liked": false,
            "alt": "Modern architecture of Deniz Mall against a pastel dusk sky in Baku."
        }
    ],
    
}
                  ''', 200);
                },
              );
              //act
              final val = pixabyApiRepo.getTrendingImages();
              //assert
              expect(val, isA<Future<List<PhotoModel>?>>());
            },
          );

          //status code is not 200
          test(
            'given a funtion when fetch images if status code is not 200',
            () {
              //assing
              when(
                () => mockHttpClient.get(uri, headers: headers),
              ).thenAnswer(
                (invocation) async {
                  return Response('{}', 200);
                },
              );
              //act
              final val = pixabyApiRepo.getTrendingImages();
              //assert
              expect(val, throwsException);
            },
          );
        },
      );
    },
  );
}
