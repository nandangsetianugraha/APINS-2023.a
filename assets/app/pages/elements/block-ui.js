"use strict";
$(function() {
    var target = "#blockui-target";
    $("#blockui-trigger-1").on("click", function() {
        $(target).block()
    });
    $("#blockui-trigger-2").on("click", function() {
        $(target).unblock()
    });
    $("#blockui-trigger-3").on("click", function() {
        $(target).block({
            timeout: 1e3
        })
    });
    $("#blockui-trigger-4").on("click", function() {
        $(target).block({
            message: "Custom text here...",
            timeout: 1e3
        })
    });
    $("#blockui-trigger-5").on("click", function() {
        $(target).block({
            message: '\n        <form class="py-2">\n          <input type="email" class="form-control mb-3" placeholder="Email">\n          <input type="password" class="form-control mb-3" placeholder="Password">\n          <button type="submit" class="btn btn-primary">Submit</button>\n        </form>\n      '
        })
    });
    $("#blockui-trigger-6").on("click", function() {
        $(target).block({
            overlayCSS: {
                backgroundColor: "#2196f3"
            },
            css: {
                backgroundColor: "#ffeb3b"
            },
            timeout: 1e3
        })
    });
    $("#blockui-trigger-7").on("click", function() {
        $.blockUI({
            timeout: 1e3
        })
    });
    $("#blockui-trigger-8").on("click", function() {
        $(target).block({
            message: '\n        <div class="spinner-border text-primary"></div>\n        <h1 class="blockui blockui-title">Please Wait...</h1>\n      ',
            timeout: 1e3
        })
    });
    $("#blockui-trigger-9").on("click", function() {
        $(target).block({
            message: '\n        <div class="spinner-grow text-success"></div>\n        <h1 class="blockui blockui-title">Processing...</h1>\n      ',
            timeout: 1e3
        })
    });
    $("#blockui-trigger-10").on("click", function() {
        $(target).block({
            message: '<div class="spinner-border text-primary m-0"></div>',
            overlayCSS: {
                backgroundColor: "#fff"
            },
            css: {
                backgroundColor: "transparent"
            },
            timeout: 1e3
        })
    })
});