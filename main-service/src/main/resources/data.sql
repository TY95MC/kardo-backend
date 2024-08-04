INSERT INTO events VALUES (1, '2025-01-01 12:12:12',
                           '2025-04-04 13:50:12',
                           'event number 1',
                           'VIDEO_CHALLENGE',
                           'event1',
                           'location1',
                           false);
INSERT INTO events VALUES (2, '2025-04-13 13:00:00',
                           '2025-05-04 20:00:00',
                           'event number 2',
                           'GRAND_FINAL',
                           'event2',
                           'location2',
                           false);
INSERT INTO events VALUES (3, '2025-02-13 12:00:00',
                           '2025-03-04 20:00:00',
                           'event number 3',
                           'CHILDREN',
                           'event3',
                           'location3',
                           false);
INSERT INTO events VALUES (4, '2025-02-20 14:00:00',
                           '2025-02-21 18:00:00',
                           'event number 4',
                           'COMPETITIONS',
                           'event4',
                           'location4',
                           false);
INSERT INTO events VALUES (5, '2025-03-17 14:00:00',
                           '2025-03-19 18:00:00',
                           'event number 5',
                           'AWARD',
                           'event5',
                           'location5', false
                          );
INSERT INTO events VALUES (6, '2025-06-01 14:00:00',
                           '2025-07-01 18:00:00',
                           'event number 6',
                           'PROJECTS',
                           'event6',
                           'location6', false
                          );


INSERT INTO events VALUES (7, '2025-04-01 13:00:00',
                           '2025-05-01 19:00:00',
                           'event number 7',
                           null,
                           'event7',
                           'location7', true
                          );

INSERT INTO event_directions VALUES
    (7, 'BMX');