import { graphviz } from "@hpcc-js/wasm/dist/graphviz.es6";
import svgPanZoom from "svg-pan-zoom";

Elm.Main.init({ node: document.getElementById("root") });

customElements.define(
  "graphviz-dot",
  class extends HTMLElement {
    static get observedAttributes() {
      return ["dot"];
    }

    attributeChangedCallback() {
      this.update();
    }

    update() {
      const dot = this.getAttribute("dot");
      if (dot == null) {
        this.innerHTML = "";
        return;
      }

      // Render DOT into SVG.
      graphviz
        .dot(dot)
        .then((svgString) => {
          this.innerHTML = svgString;
          const svgElement = this.firstElementChild;
          if (svgElement instanceof SVGSVGElement) {
            // Styling.
            svgElement.style.width = "100%";
            svgElement.style.height = "100%";
            svgElement.style.cursor = "default";

            // <title> elements are shown as tooltips in SVG. Graphviz
            // generates titles such as “G” and “2->8” from the code that
            // elm-graph generates. Those are just noisy. This is the only
            // way I’ve found the get rid of them.
            svgElement
              .querySelectorAll("title")
              .forEach((title) => title.remove());

            // For the “Double-click to filter by this node” feature.
            svgElement.ondblclick = (event) => {
              const { target } = event;
              if (target instanceof Element) {
                const node = target.closest(".node");
                if (node !== null) {
                  // Let Elm know which node we clicked.
                  this.dispatchEvent(
                    new CustomEvent("NodeDoubleClicked", { detail: node.id })
                  );
                }
              }
            };

            // Enable drag-to-pan and scroll-to-zoom. Zoom out a little bit to
            // avoid the graph touching the edges of the viewport, that looks better.
            svgPanZoom(svgElement, {
              dblClickZoomEnabled: false,
            }).zoomBy(0.9);
          }
          return undefined;
        })
        .catch((error) => {
          console.error(
            "Failed to render using Graphviz and svg-pan-zoom",
            error
          );
        });
    }
  }
);
