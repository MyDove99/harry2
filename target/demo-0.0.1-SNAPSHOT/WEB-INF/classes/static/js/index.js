function click(){
    var hide = document.querySelector('.hide');
    var button = document.querySelector('.Top-Menu-Button');
    setTimeout(() => {
        hide.style.WebkitAnimation = "fadeIn 1s";
        hide.style.animation = "fadeIn 1s";
    setTimeout(() =>{
        hide.style.display = "block";
    })
    })
}