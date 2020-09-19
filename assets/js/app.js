// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.scss";

import { Socket } from "phoenix";

let socket = new Socket("/socket", { params: { token: window.userToken } });

socket.connect();

// Now that you are connected, you can join channels with a topic:
let channel = socket.channel("pokemons", {});
channel
  .join()
  .receive("ok", (resp) => {
    console.log("Joined successfully", resp);
  })
  .receive("error", (resp) => {
    console.log("Unable to join", resp);
  });

channel.on("new-pokemon", (pokemon) => {
  const pokemonEl = document.createElement("p");
  pokemonEl.appendChild(document.createTextNode(JSON.stringify(pokemon)));
  document.getElementById("pokemons").appendChild(pokemonEl);
});

import "phoenix_html";
