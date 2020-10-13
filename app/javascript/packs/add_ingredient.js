let myInput = document.querySelector("#add-ingredient");
let wrapper = document.querySelector(".wrapper");
let ingredients = wrapper.querySelector(".content-added");
myInput.onkeydown = function (e) {
  e = e || window.event;
  if (e.keyCode == 13) {
    e.preventDefault();

    let ingredientObj = {
      value: myInput.value,
      name: "recipe[ingredients][]",
    };
    let groupIngredient = document.createElement("div");
    groupIngredient.innerHTML = ingredientTemplate(ingredientObj);
    // Register event click
    groupIngredient
      .querySelector("button")
      .addEventListener("click", function () {
        groupIngredient.remove();
      });
    ingredients.appendChild(groupIngredient);

    myInput.value = "";
  }
};

const ingredientTemplate = (data) => {
  return `
          <div class="ingredient-wrapper flex-horizontal" id="${data.value}">
              <p>${data.value}</p>
              <input type="hidden" value="${data.value}" name="${data.name}">
              <button type="button" class="btn btn-default btn-sm delete-ingredient">
                  <span class="glyphicon glyphicon-trash"></span>
              </button>
          </div>
          `;
};
