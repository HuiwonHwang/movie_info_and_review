/**
 * 
 */
let position = 0;

function movieNext(){

    position++;

    if(position > 5){
        position = 5;
    }

    document.querySelector("#movieview").style.marginLeft =
        -(position * 280) + "px";
}


function moviePrev(){

    position--;

    if(position < 0){
        position = 0;
    }

    document.querySelector("#movieview").style.marginLeft =
        -(position * 280) + "px";
}