# Chatworker


## How to use?

``` coffeescript
$ ->
  $.ajax
    type: "GET"
    url: "/icons.json"
    data:
      icon_class_names: ["cw_aXXXXXX", "cw_aYYYYYY", "cw_aZZZZZZ"]
  .done (data) =>
    console.log data
```

``` javascript
(function() {
  $(function() {
    var _this = this;

    return $.ajax({
      type: "GET",
      url: "/icons.json",
      data: {
        icon_class_names: ["cw_aXXXXXX", "cw_aYYYYYY", "cw_aZZZZZZ"]
      }
    }).done(function(data) {
      return console.log(data);
    });
  });

}).call(this);
```
