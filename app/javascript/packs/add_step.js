let myInput = document.querySelector("#add-step");
let wrapper = document.querySelector(".wrapper");
let steps = wrapper.querySelector(".content-added-step");
myInput.onkeydown = function (e) {
  e = e || window.event;
  if (e.keyCode == 13) {
    e.preventDefault();

    let stepObj = {
      value: myInput.value,
      name: "recipe[steps][]",
    };
    let groupStep = document.createElement("div");
    groupStep.innerHTML = stepTemplate(stepObj);
    // Register event click
    groupStep
      .querySelector("button")
      .addEventListener("click", function () {
        groupStep.remove();
      });
    steps.appendChild(groupStep);

    myInput.value = "";
  }
};

const stepTemplate = (data) => {
  return `
          <div class="step-wrapper flex-horizontal" id="${data.value}">
              <p>${data.value}</p>
              <input type="hidden" value="${data.value}" name="${data.name}">
              <button type="button" class="btn btn-default btn-sm delete-step">
                  <span class="glyphicon glyphicon-trash"></span>
              </button>
          </div>
          `;
};
