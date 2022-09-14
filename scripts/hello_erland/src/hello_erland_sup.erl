-module(hello_erland_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
	Procs = [{tcp_worker,{worker1,start,[]},permanent,10000,worker,[]}],
	%% Procs = [],
	{ok, {{one_for_one, 1, 5}, Procs}}.
