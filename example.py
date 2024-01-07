from votifier import VoteV1, Client

v = VoteV1('EliteToplist.net', 'Netherwhal', 'player-ip')
c = Client('server-ip', 'public-key')
c.vote(v)
