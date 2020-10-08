let myInput = document.querySelector(".wrapper #add-step");
let wrapper = document.querySelector(".wrapper");    
myInput.onkeydown = function(e) {
    e = e || window.event;
    if (e.keyCode == 13) {
        e.preventDefault();

        let value = myInput.value;
        let step = document.createElement("p");
        step.innerHTML = value;
        wrapper.querySelector(".content-added-step").appendChild(step);
        
        let hiddenInput = document.createElement("input");
        hiddenInput.value = value;
        hiddenInput.type = "hidden";
        hiddenInput.name = "recipe[steps][]";
        wrapper.querySelector(".content-added-step").appendChild(hiddenInput);

        myInput.value = "";

    }
};
