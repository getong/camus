%%
%% Copyright (c) 2016-2018 Vitor Enes.  All Rights Reserved.
%% Copyright (c) 2019 Georges Younes.  All Rights Reserved.
%%
%% This file is provided to you under the Apache License,
%% Version 2.0 (the "License"); you may not use this file
%% except in compliance with the License.  You may obtain
%% a copy of the License at
%%
%%   http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing,
%% software distributed under the License is distributed on an
%% "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
%% KIND, either express or implied.  See the License for the
%% specific language governing permissions and limitations
%% under the License.
%%
%% -------------------------------------------------------------------

-module(camus_json).
-author("Vitor Enes <vitorenesduarte@gmail.com").
-author("Georges Younes <georges.r.younes@gmail.com>").

-include("camus.hrl").

%% camus_json callbacks
-export([encode/1,
         decode/1]).

%% @doc
encode(D) ->
    jsx:encode(D).

%% @doc
decode(E) when is_list(E) ->
    decode(list_to_binary(E));
decode(E) when is_binary(E) ->
    Opts = [{labels, atom}, return_maps],
    jsx:decode(E, Opts).