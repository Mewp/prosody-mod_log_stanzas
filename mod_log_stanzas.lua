local jid_bare = require "util.jid".bare;
local jid_split = require "util.jid".split;
local datetime = require "util.datetime";


local function handle_stanza(event)
    local origin, stanza = event.origin, event.stanza;
    local f = io.open(module:get_option_string("stanza_log_file", "/tmp/log.xml"), "a+");
    f:write("<stanza ts='" .. datetime.datetime() .. "'>" .. tostring(stanza) .. "</stanza>\n");
    f:close();
end

module:hook("pre-message/bare", handle_stanza, 1);
module:hook("pre-message/full", handle_stanza, 1);
module:hook("pre-message/host", handle_stanza, 1);
module:hook("pre-iq/bare", handle_stanza, 1);
module:hook("pre-iq/full", handle_stanza, 1);
module:hook("pre-iq/host", handle_stanza, 1);
module:hook("pre-presence/bare", handle_stanza, 1);
module:hook("pre-presence/full", handle_stanza, 1);
module:hook("pre-presence/host", handle_stanza, 1);

module:hook("message/bare", handle_stanza, 1);
module:hook("message/full", handle_stanza, 1);
module:hook("message/host", handle_stanza, 1);
module:hook("iq/bare", handle_stanza, 1);
module:hook("iq/full", handle_stanza, 1);
module:hook("iq/host", handle_stanza, 1);
module:hook("presence/bare", handle_stanza, 1);
module:hook("presence/full", handle_stanza, 1);
module:hook("presence/host", handle_stanza, 1);
