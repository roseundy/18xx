# frozen_string_literal: true

# TODO: list for 1825.
# (working on unit 3 to start)
# map - done
# map labels - done
# tileset - done
# weird promotion rules
# trains - done
# phases
# companies + minors - done
# privates - done
# market - done
# minor floating rules (train value)
# share price movemennt
#
# PHASE 2.
# Unit 2, with options for choosing which units you play with.
#
# PHASE 3
# Unit 1 + regional kits.

require_relative 'meta'
require_relative '../base'

module Engine
  module Game
    module G1825
      class Game < Game::Base
        include_meta(G1825::Meta)

        register_colors(black: '#37383a',
                        seRed: '#f72d2d',
                        bePurple: '#2d0047',
                        peBlack: '#000',
                        beBlue: '#c3deeb',
                        heGreen: '#78c292',
                        oegray: '#6e6966',
                        weYellow: '#ebff45',
                        beBrown: '#54230e',
                        gray: '#6e6966',
                        red: '#d81e3e',
                        turquoise: '#00a993',
                        blue: '#0189d1',
                        brown: '#7b352a')

        CURRENCY_FORMAT_STR = '£%d'

        BANK_CASH = 7_000

        CERT_LIMIT = { 2 => 17, 3 => 15 }.freeze

        STARTING_CASH = { 2 => 750, 3 => 750 }.freeze

        CAPITALIZATION = :full

        MUST_SELL_IN_BLOCKS = false

        # this is the Unit-3 tileset for now.
        TILES = {
          '1' => 1,
          '2' => 1,
          '3' => 1,
          '4' => 3,
          '5' => 2,
          '6' => 2,
          '7' => 3,
          '8' => 6,
          '9' => 5,
          '55' => 1,
          '56' => 1,
          '115' => 1,
          '12' => 2,
          '13' => 1,
          '14' => 3,
          '15' => 3,
          '16' => 1,
          '19' => 1,
          '23' => 3,
          '24' => 3,
          '26' => 1,
          '27' => 1,
          '28' => 1,
          '29' => 1,
          '52' => 2,
          '81' =>
          {
            'count' => 1,
            'color' => 'green',
            'code' => 'path=a:0,b:2;path=a:2,b:4;path=a:4,b:0',
          },
          '34' => 1,
          '38' => 2,
          '39' => 1,
          '41' => 1,
          '42' => 1,
          '43' => 1,
          '44' => 1,
          '45' => 1,
          '46' => 1,
          '47' => 1,
          '63' => 2,
          '66' => 2,
          '67' => 1,
          '118' => 1,
        }.freeze

        MARKET = [
          %w[0c
             5
             10
             16
             24
             34
             42
             49
             55
             61
             67
             71
             76
             82
             90
             100
             112
             126
             142
             160
             180
             205
             230
             255
             280
             300
             320
             340],
        ].freeze

        PHASES = [
          {
            name: '1',
            on: '2',
            train_limit: { minor: 4, major: 4 },
            tiles: [:yellow],
            operating_rounds: 1,
          },
          {
            name: '2',
            on: '3',
            train_limit: { minor: 4, major: 4 },
            tiles: %i[yellow green],
            operating_rounds: 2,
          },
          {
            name: '3',
            on: '5',
            train_limit: { minor: 3, major: 3 },
            tiles: %i[yellow green brown],
            operating_rounds: 3,
          },
        ].freeze

        # Unit 3 train set.
        TRAINS = [{ name: '2', distance: 2, price: 180, rusts_on: '5', num: 5 },
                  { name: '3', distance: 3, price: 300, num: 3 },
                  { name: '4', distance: 4, price: 430, num: 1 },
                  { name: '5', distance: 5, price: 550, num: 2 },
                  {
                    name: '3T',
                    distance: 3,
                    price: 370,
                    num: 2,
                    available_on: '5',
                  },
                  {
                    name: 'U3',
                    distance: 3,
                    price: 410,
                    num: 2,
                    available_on: '5',
                  },
                  { name: '7', distance: 7, price: 720, num: 2 }].freeze

        COMPANIES = [
          {
            name: 'Arbroath & Forfar',
            sym: 'A&F',
            value: 30,
            revenue: 5,
            color: :Green,
            abilities: [{ type: 'no_buy' }],
          },
          {
            name: 'Tanfield Wagon Way',
            sym: 'TWW',
            value: 60,
            revenue: 10,
            color: :Green,
            abilities: [{ type: 'no_buy' }],
          },
          {
            name: 'Stockton & Darlington',
            sym: 'S&D',
            value: 160,
            revenue: 25,
            color: :Green,
            abilities: [{ type: 'no_buy' }],
          },
        ].freeze

        CORPORATIONS = [
          {
            sym: 'CR',
            name: 'Caledonia Railway',
            tokens: [0, 40, 100, 100],
            coordinates: 'G5',
            city: 2,
            color: :Blue,
            reservation_color: nil,
          },
          {
            sym: 'NBR',
            name: 'North British Railway',
            tokens: [0, 40, 100, 100],
            coordinates: 'G5',
            city: 1,
            color: '#868c1b',
            reservation_color: nil,
          },
          {
            sym: 'GS',
            name: 'Glasgow & South West Railway Company',
            tokens: [0, 40, 100],
            coordinates: 'G5',
            city: 0,
            color: '#8c1b2f',
            reservation_color: nil,
          },
          {
            sym: 'GN',
            name: 'Great North of Scotland Railway',
            tokens: [0],
            coordinates: 'B12',
            city: 0,
            color: '#0c6b0c',
            traincost: 550,
            train: '5',
          },
          {
            sym: 'HR',
            name: 'Highland Railway',
            tokens: [0],
            coordinates: 'B8',
            city: 0,
            color: '#e0b53d',
            traincost: 410,
            train: 'U3',
          },
          {
            sym: 'M&C',
            name: 'Maryport and Carslisle Railway Company',
            tokens: [0],
            coordinates: 'K7',
            city: 0,
            color: '#1b967a',
            traincost: 370,
            train: '3T',
          },
        ].freeze

        LOCATION_NAMES = {
          'B8' => 'Inverness',
        }.freeze

        HEXES = {
          yellow: {
            %w[ A2 ] => 'path=a:0,b:4',
            %w[ A4 A12 A14 A16 A18 A20 C4 C12 C14 C16 C18 C20] => 'path=a:1,b:4',
            #%w[ A8 ] => 'town=revenue:10;town=revenue:10;path=a:1,b:_0;path=a:4,b:_0;path=a:0,b:_1;path=a:5,b:_1',
            #%w[ C8 ] => 'town=revenue:10;town=revenue:10;path=a:1,b:_0;path=a:4,b:_0;path=a:2,b:_1;path=a:3,b:_1',
            %w[ B1 ] => 'path=a:3,b:5',
            %w[ C2 ] => 'path=a:2,b:4',
            %w[ A22 ] => 'path=a:1,b:5',
            %w[ B23 ] => 'path=a:2,b:0',
            %w[ C22 ] => 'path=a:3,b:1',
          },
          green: {
            %w[ A6 ] => 'city=revenue:30;path=a:1,b:_0;path=a:4,b:_0;path=a:5,b:_0',
            %w[ C6 ] => 'city=revenue:30;path=a:1,b:_0;path=a:4,b:_0;path=a:3,b:_0',
            %w[ A10 ] => 'city=revenue:30;path=a:1,b:_0;path=a:4,b:_0;path=a:0,b:_0',
            %w[ C10 ] => 'city=revenue:30;path=a:1,b:_0;path=a:4,b:_0;path=a:2,b:_0',
          },
          brown: {
            %w[ A8 ] => 'city=revenue:40;path=a:0,b:_0;path=a:1,b:_0;path=a:4,b:_0;path=a:5,b:_0',
            %w[ C8 ] => 'city=revenue:40;path=a:2,b:_0;path=a:1,b:_0;path=a:4,b:_0;path=a:3,b:_0',
          },
          gray: {
            %w[
            B3 B5 B13 B15 B17 B19 B21
            ] => '',
            %w[
            B7 B9
            ] => 'path=a:0,b:3;path=a:2,b:5',
            %w[
            B11
            ] => 'town=revenue:0,loc:5.5',
          },
        }.freeze

        LAYOUT = :pointy

        SELL_MOVEMENT = :down_per_10

        HOME_TOKEN_TIMING = :operating_round

        def setup
          @minors.each do |minor|
            hex = hex_by_id(minor.coordinates)
            hex.tile.add_reservation!(minor, minor.city)
          end
        end

        def operating_round(round_num)
          Round::Operating.new(self, [
            Step::Bankrupt,
            Step::Exchange,
            Step::BuyCompany,
            Step::Track,
            Step::Token,
            Step::Route,
            Step::Dividend,
            Step::BuyTrain,
            [Step::BuyCompany, { blocks: true }],
          ], round_num: round_num)
        end
      end
    end
  end
end
