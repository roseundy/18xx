# frozen_string_literal: true

module Engine
  module Game
    module G1837
      module Entities
        COMPANIES = [
          {
            name: 'Block Bosnia-Herzegovina hexes',
            sym: '3',
            value: 0,
            meta: { hidden: true },
            abilities: [
              { type: 'blocks_hexes', remove: '3', hexes: %w[L16 L18 L20 M17 M19 M21 N18 N20] },
            ],
          },
          {
            name: 'Pilsen-Priesen Railway',
            sym: 'EPP',
            value: 40,
            desc: 'Located in E11 with 100K starting capital. Coal companies cannot be sold and can only run ' \
                  'G trains. The company can be exchanged for a 10% share of Bohemian Commercial Railway (BK) at ' \
                  'the start of an operating round.',
            color: :black,
            text_color: :white,
            meta: { start_packet: true, type: :coal },
            abilities: [
              {
                type: 'exchange',
                corporations: ['BK'],
                owner_type: 'player',
                when: 'exchange',
                from: 'reserved',
              },
              {
                type: 'no_buy',
              },
            ],
          },
          {
            name: 'Reichenberg-Gablonz-Tannwalder Railway',
            sym: 'RGTE',
            value: 40,
            desc: 'Located in A13 with 100K starting capital. Coal companies cannot be sold and can only run ' \
                  'G trains. The company can be exchanged for a 10% share of Bohemian Commercial Railway (BK) at ' \
                  'the start of an operating round.',
            color: :black,
            text_color: :white,
            meta: { start_packet: true, type: :coal },
            abilities: [
              {
                type: 'exchange',
                corporations: ['BK'],
                owner_type: 'player',
                when: 'exchange',
                from: 'reserved',
              },
              {
                type: 'no_buy',
              },
            ],
          },
          {
            name: 'Oderberg-Dombran Railway',
            sym: 'EOD',
            value: 40,
            desc: 'Located in C19 with 100K starting capital. Coal companies cannot be sold and can only run ' \
                  'G trains. The company can be exchanged for a 10% share of Moravian-Silesian Railway (MS) at the ' \
                  'start of an operating round.',
            color: :black,
            text_color: :white,
            meta: { start_packet: true, type: :coal },
            abilities: [
              {
                type: 'exchange',
                corporations: ['MS'],
                owner_type: 'player',
                when: 'exchange',
                from: 'reserved',
              },
              {
                type: 'no_buy',
              },
            ],
          },
          {
            name: 'Karwin-Teschen Railway',
            sym: 'EKT',
            value: 40,
            desc: 'Located in C21 with 100K starting capital. Coal companies cannot be sold and can only run ' \
                  'G trains. The company can be exchanged for a 10% share of Moravian-Silesian Railway (MS) at the ' \
                  'start of an operating round.',
            color: :black,
            text_color: :white,
            meta: { start_packet: true, type: :coal },
            abilities: [
              {
                type: 'exchange',
                corporations: ['MS'],
                owner_type: 'player',
                when: 'exchange',
                from: 'reserved',
              },
              {
                type: 'no_buy',
              },
            ],
          },
          {
            name: 'Mosty-Lemberg Railway',
            sym: 'MLB',
            value: 40,
            desc: 'Located in B32 with 100K starting capital. Coal companies cannot be sold and can only run ' \
                  'G trains. The company can be exchanged for a 10% share of Carl Ludwig’s Railway (CL) at the ' \
                  'start of an operating round.',
            color: :black,
            text_color: :white,
            meta: { start_packet: true, type: :coal },
            abilities: [
              {
                type: 'exchange',
                corporations: ['CL'],
                owner_type: 'player',
                when: 'exchange',
                from: 'reserved',
              },
              {
                type: 'no_buy',
              },
            ],
          },
          {
            name: 'Zarnesti-Kronstadt Railway',
            sym: 'ZKB',
            value: 40,
            desc: 'Located in K33 with 100K starting capital. Coal companies cannot be sold and can only run ' \
                  'G trains. The company can be exchanged for a 10% share of Transylvanian Railway (TR) at the ' \
                  'start of an operating round.',
            color: :black,
            text_color: :white,
            meta: { start_packet: true, type: :coal },
            abilities: [
              {
                type: 'exchange',
                corporations: ['TR'],
                owner_type: 'player',
                when: 'exchange',
                from: 'reserved',
              },
              {
                type: 'no_buy',
              },
            ],
          },
          {
            name: 'Simeria-Petroseni Railway',
            sym: 'SPB',
            value: 40,
            desc: 'Located in K31 with 100K starting capital. Coal companies cannot be sold and can only run ' \
                  'G trains. The company can be exchanged for a 10% share of Transylvanian Railway (TR) at the ' \
                  'start of an operating round.',
            color: :black,
            text_color: :white,
            meta: { start_packet: true, type: :coal },
            abilities: [
              {
                type: 'exchange',
                corporations: ['TR'],
                owner_type: 'player',
                when: 'exchange',
                from: 'reserved',
              },
              {
                type: 'no_buy',
              },
            ],
          },
          {
            name: 'Lugoj-Resita Railway',
            sym: 'LRB',
            value: 40,
            desc: 'Located in L30 with 100K starting capital. Coal companies cannot be sold and can only run ' \
                  'G trains. The company can be exchanged for a 10% share of Tisza Railway (TI) at the start of ' \
                  'an operating round.',
            color: :black,
            text_color: :white,
            meta: { start_packet: true, type: :coal },
            abilities: [
              {
                type: 'exchange',
                corporations: ['TI'],
                owner_type: 'player',
                when: 'exchange',
                from: 'reserved',
              },
              {
                type: 'no_buy',
              },
            ],
          },
          {
            name: 'Bosna-Bahn',
            sym: 'BB',
            value: 40,
            desc: 'Located in P20 with 100K starting capital. Coal companies cannot be sold and can only run ' \
                  'G trains. The company can be exchanged for a 10% share of Bosnia-Herzegovina Railway (BH) ' \
                  'at the start of an operating round.',
            color: :black,
            text_color: :white,
            meta: { start_packet: true, type: :coal },
            abilities: [
              {
                type: 'exchange',
                corporations: ['BH'],
                owner_type: 'player',
                when: 'exchange',
                from: 'reserved',
              },
              {
                type: 'no_buy',
              },
            ],
          },
          {
            name: 'Hatvan-Salgotarjan Railway (EHS)',
            sym: 'EHS',
            value: 40,
            desc: 'Located in F26 with 100K starting capital. Coal companies cannot be sold and can only run ' \
                  'G trains. The company can be exchanged for a 10% share of Tisza Railway (TI) at the start of ' \
                  'an operating round.',
            color: :black,
            text_color: :white,
            meta: { start_packet: true, type: :coal },
            abilities: [
              {
                type: 'exchange',
                corporations: ['TI'],
                owner_type: 'player',
                when: 'exchange',
                from: 'reserved',
              },
              {
                type: 'no_buy',
              },
            ],
          },
          {
            name: 'Kaiser Ferdinand North Railway (KK1)',
            sym: 'KK1',
            value: 60,
            desc: "Director's certificate of the minor company Kaiser Ferdinand North Railway (KK1). The company " \
                  'starts in Vienna (G17) with 90K starting capital.',
            color: :brown,
            meta: { start_packet: true, type: :minor },
            abilities: [{ type: 'no_buy' }],
          },
          {
            name: 'Kaiserin Elisabeth-Railway (KK2)',
            sym: 'KK2',
            value: 60,
            desc: "Director's certificate of the minor company Kaiserin Elisabeth-Railway (KK2). The company " \
                  'starts in Vienna (G17) with 140K starting capital.',
            color: :brown,
            meta: { start_packet: true, type: :minor },
            abilities: [{ type: 'no_buy' }],
          },
          {
            name: 'Kaiser Franz Joseph-Railway (KK3)',
            sym: 'KK3',
            value: 60,
            desc: "Director's certificate of the minor company Kaiser Franz Joseph-Railway (KK3). The company " \
                  'starts in Vienna (G17) with 90K starting capital.',
            color: :brown,
            meta: { start_packet: true, type: :minor },
            abilities: [{ type: 'no_buy' }],
          },
          {
            name: 'Pest-Waitzen Railway (UG1)',
            sym: 'UG1',
            value: 80,
            desc: "Director's certificate of the minor company Pest-Waitzen Railway (UG1) " \
                  'starts in Budapest (H22) with 180K starting capital.',
            color: :pink,
            meta: { start_packet: true, type: :minor },
            abilities: [{ type: 'no_buy' }],
          },
          {
            name: 'Mohacs-Fünfkirchener Railway (UG2)',
            sym: 'UG2',
            value: 80,
            desc: "Director's certificate of the minor company Mohacs-Fünfkirchener Railway (UG2). The company " \
                  'starts in Fün%irchen (K21) with 90K starting capital.',
            color: :pink,
            meta: { start_packet: true, type: :minor },
            abilities: [{ type: 'no_buy' }],
          },
          {
            name: 'Pest-Czegled Railway (UG3)',
            sym: 'UG3',
            value: 80,
            desc: "Director's certificate of the minor company Pest-Czegled Railway (UG3). The company " \
                  'starts in Budapest (H22) with 180K starting capital.',
            color: :pink,
            meta: { start_packet: true, type: :minor },
            abilities: [{ type: 'no_buy' }],
          },
          {
            name: 'Vienna-Gloggnitzer Railway (SD1)',
            sym: 'SD1',
            value: 100,
            desc: "Director's certificate of the minor company Vienna-Gloggnitzer Railway (SD1). The company " \
                  "starts in Vienna (G17) with 90K starting capital.\n\nComes with the Mountain Railway " \
                  'Semmering Railway (H16) that has a value of 100K and a revenue of 5K.',
            color: :orange,
            meta: { start_packet: true, type: :minor, additional_companies: ['Semmering'] },
            abilities: [{ type: 'no_buy' }],
          },
          {
            name: 'Kärntner Railway (SD2)',
            sym: 'SD2',
            value: 120,
            desc: "Director's certificate of the minor company Kärntner Railway (SD2). The company " \
                  "starts in Marburg (J16) with 90K starting capital.\n\n =Comes with the Mountain Railway " \
                  'Karawanken Railway (J12) that has a value of 120K and a revenue of 25K.',
            color: :orange,
            meta: { start_packet: true, type: :minor, additional_companies: ['Karawanken'] },
            abilities: [{ type: 'no_buy' }],
          },
          {
            name: 'North Tyrol Railway (SD3)',
            sym: 'SD3',
            value: 135,
            desc: "Director's certificate of the minor company North Tyrol Railway (SD3). The company " \
                  "starts in Innsbruck (I7) with 90K starting capital.\n\nComes with the Mountain Railway " \
                  'Arlberg Railway (I5) that has a value of 135K and a revenue of 20K.',
            color: :orange,
            meta: { start_packet: true, type: :minor, additional_companies: ['Arlberg'] },
            abilities: [{ type: 'no_buy' }],
          },
          {
            name: 'South Tyrol Railway (SD4)',
            sym: 'SD4',
            value: 90,
            desc: "Director's certificate of the minor company South Tyrol Railway (SD4). The company " \
                  "starts in Bozen (K5) with 90K starting capital.\n\nComes with the Mountain Railway " \
                  'Brenner Railway (J6) that has a value of 90K and a revenue of 15K.',
            color: :orange,
            meta: { start_packet: true, type: :minor, additional_companies: ['Brenner'] },
            abilities: [{ type: 'no_buy' }],
          },
          {
            name: 'Venice-Lombardy Railway (SD5)',
            sym: 'SD5',
            value: 70,
            desc: "Director's certificate of the minor company Venice-Lombardy Railway (SD5). The company " \
                  "starts in Milan (L2) or Venice (L8), the director chooses, with 90K starting capital.\n\n" \
                  'Comes with the Mountain Railway Karst Railway (K13) that has a value of 70K and a revenue of 10K.',
            color: :orange,
            meta: { start_packet: true, type: :minor, additional_companies: ['Karst'] },
            abilities: [{ type: 'no_buy' }],
          },
          {
            name: 'Pest-Waitzen Railway (UG1) share',
            sym: 'UG1_share',
            value: 90,
            desc: 'A share of the minor company Pest-Waitzen Railway (UG1).',
            color: :pink,
            meta: { type: :share },
            abilities: [{ type: 'no_buy' }],
          },
          {
            name: 'Pest-Czegled Railway (UG3) share',
            sym: 'UG3_share',
            value: 90,
            desc: 'A share of the minor company Pest-Czegled Railway (UG3).',
            color: :pink,
            meta: { type: :share },
            abilities: [{ type: 'no_buy' }],
          },
          {
            name: 'Semmering Railway',
            sym: 'Semmering',
            desc: "Owning player's companies do not pay the terrain cost when laying a tile on H16. " \
                  "Other players' companies are blocked from laying track on H16 until Phase 3. " \
                  'The company closes at the start of Phase 5.',
            value: 100,
            revenue: 5,
            color: :gray,
            meta: { type: :mountain_railway },
            abilities: [
              { type: 'no_buy' },
              {
                type: 'tile_lay',
                owner_type: 'player',
                when: 'owning_player_track',
                consume_tile_lay: true,
                reachable: true,
                special: false,
                discount: 110,
                hexes: %w[H16],
                tiles: %w[7 8 9],
                count: 1,
              },
              {
                type: 'blocks_hexes',
                remove: '3',
                hexes: %w[H16],
              },
            ],
          },
          {
            name: 'Karst Railway',
            sym: 'Karst',
            desc: "Owning player's companies do not pay the terrain cost when laying a tile on K13. " \
                  "Other players' companies are blocked from laying track on K13 until Phase 3. " \
                  'The company closes at the start of Phase 5.',
            value: 70,
            revenue: 10,
            color: :gray,
            meta: { type: :mountain_railway },
            abilities: [
              { type: 'no_buy' },
              {
                type: 'tile_lay',
                owner_type: 'player',
                when: 'owning_player_track',
                consume_tile_lay: true,
                reachable: true,
                special: false,
                discount: 110,
                hexes: %w[K13],
                tiles: %w[3 4 58],
                count: 1,
              },
              {
                type: 'blocks_hexes',
                remove: '3',
                hexes: %w[K13],
              },
            ],
          },
          {
            name: 'Brenner Railway',
            sym: 'Brenner',
            desc: "Owning player's companies do not pay the terrain cost when laying a tile on J6. " \
                  "Other players' companies are blocked from laying track on J6 until Phase 3. " \
                  'The company closes at the start of Phase 5.',
            value: 90,
            revenue: 15,
            color: :gray,
            meta: { type: :mountain_railway },
            abilities: [
              { type: 'no_buy' },
              {
                type: 'tile_lay',
                owner_type: 'player',
                when: 'owning_player_track',
                consume_tile_lay: true,
                reachable: true,
                special: false,
                discount: 110,
                hexes: %w[J6],
                tiles: %w[7 8 9],
                count: 1,
              },
              {
                type: 'blocks_hexes',
                remove: '3',
                hexes: %w[J6],
              },
            ],
          },
          {
            name: 'Arlberg Railway',
            sym: 'Arlberg',
            desc: "Owning player's companies do not pay the terrain cost when laying a tile on I5. " \
                  "Other players' companies are blocked from laying track on I5 until Phase 3. " \
                  'The company closes at the start of Phase 5.',
            value: 135,
            revenue: 20,
            color: :gray,
            meta: { type: :mountain_railway },
            abilities: [
              { type: 'no_buy' },
              {
                type: 'tile_lay',
                owner_type: 'player',
                when: 'owning_player_track',
                consume_tile_lay: true,
                reachable: true,
                special: false,
                discount: 110,
                hexes: %w[I5],
                tiles: %w[7 8 9],
                count: 1,
              },
              {
                type: 'blocks_hexes',
                remove: '3',
                hexes: %w[I5],
              },
            ],
          },
          {
            name: 'Karawanken Railway',
            sym: 'Karawanken',
            desc: "Owning player's companies do not pay the terrain cost when laying a tile on J12. " \
                  "Other players' companies are blocked from laying track on J12 until Phase 3. " \
                  'The company closes at the start of Phase 5.',
            value: 120,
            revenue: 25,
            color: :gray,
            meta: { type: :mountain_railway },
            abilities: [
              { type: 'no_buy' },
              {
                type: 'tile_lay',
                owner_type: 'player',
                when: 'owning_player_track',
                consume_tile_lay: true,
                reachable: true,
                special: false,
                discount: 110,
                hexes: %w[J12],
                tiles: %w[1 2 55 56 69],
                count: 1,
              },
              {
                type: 'blocks_hexes',
                remove: '3',
                hexes: %w[J12],
              },
            ],
          },
          {
            name: 'Wocheiner Railway',
            sym: 'Wocheiner',
            desc: "Owning player's companies do not pay the terrain cost when laying a tile on K11. " \
                  "Other players' companies are blocked from laying track on K11 until Phase 3. " \
                  'The company closes at the start of Phase 5.',
            value: 50,
            revenue: 30,
            color: :gray,
            meta: { start_packet: true, type: :mountain_railway },
            abilities: [
              { type: 'no_buy' },
              {
                type: 'tile_lay',
                owner_type: 'player',
                when: 'owning_player_track',
                consume_tile_lay: true,
                reachable: true,
                special: false,
                discount: 110,
                hexes: %w[K11],
                tiles: %w[7 8 9],
                count: 1,
              },
              {
                type: 'blocks_hexes',
                remove: '3',
                hexes: %w[K11],
              },
            ],
          },
          {
            name: 'Tauern Railway',
            sym: 'Tauern',
            desc: "Owning player's companies do not pay the terrain cost when laying a tile on J10. " \
                  "Other players' companies are blocked from laying track on J10 until Phase 3. " \
                  'The company closes at the start of Phase 5.',
            value: 70,
            revenue: 35,
            color: :gray,
            meta: { start_packet: true, type: :mountain_railway },
            abilities: [
              { type: 'no_buy' },
              {
                type: 'tile_lay',
                owner_type: 'player',
                when: 'owning_player_track',
                consume_tile_lay: true,
                reachable: true,
                special: false,
                discount: 110,
                hexes: %w[J10],
                tiles: %w[7 8 9],
                count: 1,
              },
              {
                type: 'blocks_hexes',
                remove: '3',
                hexes: %w[J10],
              },
            ],
          },
        ].freeze

        MINORS = [
          {
            name: 'Pilsen-Priesen Railway',
            sym: 'EPP',
            type: 'coal',
            logo: '1837/epp',
            tokens: [0],
            coordinates: 'E11',
            color: :black,
          },
          {
            name: 'Reichenberg-Gablonz-Tannwalder Railway',
            sym: 'RGTE',
            type: 'coal',
            logo: '1837/rgte',
            tokens: [0],
            coordinates: 'A13',
            color: :black,
          },
          {
            name: 'Oderberg-Dombran Railway',
            sym: 'EOD',
            type: 'coal',
            logo: '1837/eod',
            tokens: [0],
            coordinates: 'C19',
            color: :black,
          },
          {
            name: 'Karwin-Teschen Railway',
            sym: 'EKT',
            type: 'coal',
            logo: '1837/ekt',
            tokens: [0],
            coordinates: 'C21',
            color: :black,
          },
          {
            name: 'Mosty-Lemberg Railway',
            sym: 'MLB',
            type: 'coal',
            logo: '1837/mlb',
            tokens: [0],
            coordinates: 'B32',
            color: :black,
          },
          {
            name: 'Zarnesti-Kronstadt Railway',
            sym: 'ZKB',
            type: 'coal',
            logo: '1837/zkb',
            tokens: [0],
            coordinates: 'K33',
            color: :black,
          },
          {
            name: 'Simeria-Petroseni Railway',
            sym: 'SPB',
            type: 'coal',
            logo: '1837/spb',
            tokens: [0],
            coordinates: 'K31',
            color: :black,
          },
          {
            name: 'Lugoj-Resita Railway',
            sym: 'LRB',
            type: 'coal',
            logo: '1837/lrb',
            tokens: [0],
            coordinates: 'L30',
            color: :black,
          },
          {
            name: 'Bosna-Bahn',
            sym: 'BB',
            type: 'coal',
            logo: '1837/bb',
            tokens: [0],
            coordinates: 'P20',
            color: :black,
          },
          {
            name: 'Hatvan-Salgotarjan Railway',
            sym: 'EHS',
            type: 'coal',
            logo: '1837/ehs',
            tokens: [0],
            coordinates: 'F26',
            color: :black,
          },
          {
            name: 'Vienna-Gloggnitzer Railway',
            sym: 'SD1',
            type: 'minor',
            logo: '1837/sd1',
            tokens: [0],
            coordinates: 'G17',
            city: 0,
            color: :orange,
          },
          {
            name: 'Kärntner Railway',
            sym: 'SD2',
            type: 'minor',
            logo: '1837/sd2',
            tokens: [0],
            coordinates: 'J16',
            color: :orange,
          },
          {
            name: 'North Tyrol Railway',
            sym: 'SD3',
            type: 'minor',
            logo: '1837/sd3',
            tokens: [0],
            coordinates: 'I7',
            color: :orange,
          },
          {
            name: 'South Tyrol Railway',
            sym: 'SD4',
            type: 'minor',
            logo: '1837/sd4',
            tokens: [0],
            coordinates: 'K5',
            color: :orange,
          },
          {
            name: 'Venice-Lombardy Railway',
            sym: 'SD5',
            type: 'minor',
            logo: '1837/sd5',
            tokens: [0],
            coordinates: %w[L2 L8],
            color: :orange,
          },
          {
            name: 'Kaiser Ferdinand North Railway',
            sym: 'KK1',
            type: 'minor',
            logo: '1837/kk1',
            tokens: [0],
            coordinates: 'G17',
            city: 3,
            color: :brown,
          },
          {
            name: 'Kaiserin Elisabeth-Railway',
            sym: 'KK2',
            type: 'minor',
            logo: '1837/kk2',
            tokens: [0],
            coordinates: 'G17',
            city: 1,
            color: :brown,
          },
          {
            name: 'Kaiser Franz Joseph-Railway',
            sym: 'KK3',
            type: 'minor',
            logo: '1837/kk3',
            tokens: [0],
            coordinates: 'G17',
            city: 2,
            color: :brown,
          },
          {
            name: 'Pest-Waitzen Railway',
            sym: 'UG1',
            type: 'minor',
            logo: '1837/ug1',
            tokens: [0],
            coordinates: 'H22',
            city: 1,
            color: :pink,
          },
          {
            name: 'Mohacs-Fünfkirchener Railway',
            sym: 'UG2',
            type: 'minor',
            logo: '1837/ug2',
            tokens: [0],
            coordinates: 'K21',
            color: :pink,
          },
          {
            name: 'Pest-Czegled Railway',
            sym: 'UG3',
            type: 'minor',
            logo: '1837/ug3',
            tokens: [0],
            coordinates: 'H22',
            city: 0,
            color: :pink,
          },
        ].freeze

        CORPORATIONS = [
          {
            name: 'Bohemian Commercial Railway',
            sym: 'BK',
            logo: '1837/bk',
            simple_logo: '1837/bk.alt',
            tokens: [0, 20, 40],
            ipo_shares: [20, 10, 10, 10, 10, 10, 10],
            reserved_shares: [10, 10],
            float_percent: 50,
            type: 'major',
            coordinates: 'C11',
            color: :blue,
          },
          {
            name: 'Moravian-Silesian Railway',
            sym: 'MS',
            logo: '1837/ms',
            simple_logo: '1837/ms.alt',
            tokens: [0, 20, 40],
            ipo_shares: [20, 10, 10, 10, 10, 10, 10],
            reserved_shares: [10, 10],
            float_percent: 50,
            type: 'major',
            coordinates: 'E17',
            color: :yellow,
            text_color: :black,
          },
          {
            name: 'Bosnia-Herzegovina Railway',
            sym: 'BH',
            logo: '1837/bh',
            simple_logo: '1837/bh.alt',
            tokens: [0, 20, 40],
            ipo_shares: [20, 10, 10, 10, 10, 10, 10, 10],
            reserved_shares: [10],
            float_percent: 50,
            type: 'major',
            coordinates: 'N20',
            color: :red,
          },
          {
            sym: 'CL',
            name: 'Carl Ludwig’s Railway',
            logo: '1837/cl',
            simple_logo: '1837/cl.alt',
            tokens: [0, 20, 40],
            ipo_shares: [20, 10, 10, 10, 10, 10, 10, 10],
            reserved_shares: [10],
            float_percent: 50,
            type: 'major',
            coordinates: 'C33',
            color: :black,
          },
          {
            name: 'Tisza Railway',
            sym: 'TI',
            logo: '1837/ti',
            simple_logo: '1837/ti.alt',
            tokens: [0, 20, 40],
            ipo_shares: [20, 10, 10, 10, 10, 10, 10],
            reserved_shares: [10, 10],
            float_percent: 50,
            type: 'major',
            coordinates: 'F28',
            color: :lightblue,
          },
          {
            name: 'Galician Transverse Railway',
            sym: 'GT',
            logo: '1837/gt',
            simple_logo: '1837/gt.alt',
            tokens: [0, 20, 40],
            float_percent: 50,
            type: 'major',
            coordinates: 'D36',
            color: :green,
          },
          {
            name: 'Transylvanian Railway',
            sym: 'TR',
            logo: '1837/tr',
            simple_logo: '1837/tr.alt',
            tokens: [0, 20, 40],
            ipo_shares: [20, 10, 10, 10, 10, 10, 10],
            reserved_shares: [10, 10],
            float_percent: 50,
            type: 'major',
            coordinates: 'J36',
            color: :lightgreen,
          },
          {
            name: 'Southern Railway',
            sym: 'SD',
            logo: '1837/sd',
            simple_logo: '1837/sd.alt',
            tokens: [],
            ipo_shares: [10, 10, 10, 10, 10],
            reserved_shares: [10, 10, 10, 10, 10],
            type: 'national',
            floatable: false,
            coordinates: 'G17',
            color: :orange,
          },
          {
            name: 'Imperial Royal Austrian State Railways',
            sym: 'KK',
            logo: '1837/kk',
            simple_logo: '1837/kk.alt',
            tokens: [],
            ipo_shares: [10, 10, 10, 10, 10, 10, 10],
            reserved_shares: [10, 10, 10],
            type: 'national',
            floatable: false,
            coordinates: 'G17',
            color: :brown,
          },
          {
            name: 'Hungarian National Railway',
            sym: 'UG',
            logo: '1837/ug',
            simple_logo: '1837/ug.alt',
            tokens: [],
            ipo_shares: [10, 10, 10, 10, 10],
            reserved_shares: [10, 10, 10, 10, 10],
            type: 'national',
            floatable: false,
            coordinates: 'H22',
            color: :pink,
          },
        ].freeze
      end
    end
  end
end
