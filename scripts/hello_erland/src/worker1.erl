-module(worker1).
-export([start/0]).

start() ->
    Dispatch = cowboy_router:compile([{'_', [{"/", hello_handler, []}]}]),
    {ok, _} = cowboy:start_clear(my_http_listener, [{port, 7000}], #{env => #{dispatch => Dispatch}}).
