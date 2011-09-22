function remove_fields (link) {
    $(link).prev("li[class=hidden]").find("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
}
function add_fields(link, association, content, container) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")
    $(link).siblings('div.'+container).append(content.replace(regexp, new_id));
}