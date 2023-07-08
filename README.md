# Lotto Results API
This is a simple API built with Sinatra that retrieves and serves lottery results. It provides endpoints to fetch the latest lottery results, results for a specific game, a list of available games, and the last results for a game.

## Installation
1. Clone the repository: `git clone https://github.com/your-username/lotto-results-api.git`
2. Install dependencies: `bundle install`

## Usage
1. Start the API server: `ruby app.rb`
2. Access the API endpoints:
- <b>GET /lotto_results:</b>  Retrieves the lottery results for all games, also includes historical data of lotto games.
- <b>GET /lotto_results/:game_name:</b> Retrieves the lottery results for a specific game.
- <b>GET /lotto_last_results/:game_name:</b> Retrieves the last results for a specific game.
- <b>GET /lotto_games:</b> Retrieves a list of available games.

## Dependencies
The following dependencies are used in this project:
- <b>Sinatra:</b> A lightweight web framework for Ruby.

## Supported Lottery Games
The API supports over 50+ Lottery games
- 10E LOTTO IT
- ARIZONA FANT.5 5/41
- ARIZONA PICK 6/44
- AUS.ZAHLEN LOTO 5/90
- AUSTRALIA OZ 7/47
- AUSTRIA
- BELGIAN LOTO 6/45
- BONO LOTO
- CAN.MAX LOTO 7/50
- CANADA ATLANTIC BUCKO 5/41
- COLORADO "CASH 5" 5/32
- COLORADO LOTTO 6/40
- CONNECTICUT
- EURO MILLIONS
- FINLAND KENO 20/70
- FLORIDA FANTASY 5
- FRENCH KENO 20/70
- FRENCH LOTO 5/49
- GREECE KINO LOTO 20/80
- IRELAND LOTO 6/47
- ITALIA
- LATVIAN KENO D 20/62
- LATVIAN KENO E 20/62
- LATVIAN KENO M 20/62
- LUCKY 5 5/36
- LUCKY 7 7/42
- MASSACHUS.MB 6/49
- HUNGARY
- MICHIGAN "FANTASY 5" 5/39
- MICHIGAN CLAS.6/47
- NEW JER. PICK SIX 6/46
- NEW YORK "PICK 10" 10/80
- NEW YORK LOTTO
- GERMANY
- GERMAN KENO 20/70
- OHIO CLASSIC LOTO
- OREGON MEGABUCK
- PENNSYLVANIA TREASURE HUNT 5/30
- POLAND LOTO 6/49
- POLAND MULTI LOTO 20/80
- QUEBEC 49
- SINGAPUR LOTO 6/49
- SLOVAKIAN LOTO 5/35
- SLOVENIA
- TENNESSEE "CA$H" 5/35
- TEXAS ALL OR NOT. 12/24
- TEXAS LOTTO 6/54
- UK LOTTO 6/59
- USA MEGAMILLIONS 5/70
- WASHINGT.LOTTO 6/49
- WIN FOR LIFE CLASSICO
- WINSCONSIN "BADGER 5" 5/31
- SPAIN
- SWITZERLAND LOTO 6/42
## License
This project is licensed under the MIT License.