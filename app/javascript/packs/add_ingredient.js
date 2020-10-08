    let myInput = document.querySelector("#add-ingredient");
    let wrapper = document.querySelector(".wrapper");    
    myInput.onkeydown = function(e) {

        e = e || window.event;
        if (e.keyCode == 13) {
            e.preventDefault()
            let value = myInput.value;
            let ingredient = document.createElement("p");
            ingredient.innerHTML = value;
            wrapper.querySelector(".content-added").appendChild(ingredient);

            let hiddenInput = document.createElement("input");
            hiddenInput.value = value;
            hiddenInput.type = "hidden";
            hiddenInput.name = "recipe[ingredients][]";
            wrapper.querySelector(".content-added").appendChild(hiddenInput);
      
            myInput.value = "";
        }

    };
