%%%-------------------------------------------------------------------
%% @doc tracker_draft public API
%% @end
%%%-------------------------------------------------------------------

-module(tracker_draft_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    tracker_draft_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
