HTMLWidgets.widget({

  name: 'mermaid',

  type: 'output',

  factory: function(el, width, height) {

    return {

      renderValue: function(x) {

        mermaid.initialize({startOnLoad: false})

        // Code to render the widget, e.g.
        el.innerHTML = x.diagram;
        el.removeAttribute("data-processed"); // force mermaid to redraw

        mermaid.init(JSON.parse(x.config));

        svg = el.getElementsByTagName("svg");
        svg[0].setAttribute("height", height);
        svg[0].setAttribute("width", width);


      },

      resize: function(width, height) {

        svg[0].setAttribute("height", height);
        svg[0].setAttribute("width", width);

      }

    };
  }
});
