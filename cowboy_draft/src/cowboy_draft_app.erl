%%%-------------------------------------------------------------------
%% @doc cowboy_draft public API
%% @end
%%%-------------------------------------------------------------------

-module(cowboy_draft_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    Dispatch = cowboy_router:compile([
        {'_',
            [ 
                {"/", default_page_h, []},
                {"/delivered", delivered_h, []}
                ]}
        
        ]),
        cowboy:start_clear(
            my_http_listener,
            [{port, 8080}], % will add real port in the future
            #{env => #{dispatch => Dispatch}}
        ),
        cowboy_draft_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
