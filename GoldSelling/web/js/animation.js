/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



function showBag()
{

    var box = document.getElementById("box-buying");
    var iconBag = document.getElementById("icon-bag");
    var iconBagHidden = document.getElementById("icon-bag-hidden");
    if (window.innerWidth > 700) {
        box.style.display = "block";
        box.style.transition = "all 0.5s";
    } else {
        hideBag();
    }
    iconBag.style.display = "none";
    iconBagHidden.style.display = "block";
    window.addEventListener("resize", showBag);
}

function hideBag()
{

    var box = document.getElementById("box-buying");
    var iconBag = document.getElementById("icon-bag");
    var iconBagHidden = document.getElementById("icon-bag-hidden");
    iconBag.style.display = "block";
    iconBagHidden.style.display = "none";
    box.style.transition = "all 0.5s";
    box.style.display = "none";
    window.removeEventListener("resize", showBag);
}

function enableSearch() {
    hideBag();
    var searchFrame = document.getElementById("search-frame");
    var centerNavHeader = document.getElementById("menu-header");
    searchFrame.style.display = "block";
    centerNavHeader.style.display = "none";
}

function hideSearch() {
    var searchFrame = document.getElementById("search-frame");
    var centerNavHeader = document.getElementById("menu-header");
    searchFrame.style.display = "none";
    centerNavHeader.style.display = "block";
}

function openDialog() {
    let url = "https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/GoldSelling/LoginWithGoogle&response_type=code&client_id=387185795669-aohnnor1vu2c5g0bnoq6lnrrmjdiiv78.apps.googleusercontent.com&approval_prompt=force";
    location = url;
}

function openDialog2() {
    let url = "https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/GoldSelling/LinkWithGoogle&response_type=code&client_id=387185795669-gsv4g26hb55f5n3rkqq18i3tkodlnt37.apps.googleusercontent.com&approval_prompt=force";
    location = url;
}

let count = 1;

function moveRight() {
    var elements = document.getElementsByClassName("element-brand");
    var container = document.getElementById("horizontal-container");
    container.scrollLeft += 350;
    container.style.transition = "all 2s";
}

function moveLeft() {
    var elements = document.getElementsByClassName("element-brand");
    var container = document.getElementById("horizontal-container");
    container.scrollLeft -= 350;
    container.style.transition = "all 2s";
}

function showTwoButtonsNav() {
    showButtonNextBrand();
    showButtonPrevBrand();
}

function hideTwoButtonsNav() {
    hideButtonNextBrand();
    hideButtonPrevBrand();
}

function showButtonNextBrand() {
    var buttonNext = document.getElementById("button-next-brand");
    buttonNext.style.display = "block";
}

function hideButtonNextBrand() {
    var buttonNext = document.getElementById("button-next-brand");
    buttonNext.style.display = "none";
}

function showButtonPrevBrand() {
    var buttonPrev = document.getElementById("button-prev-brand");
    buttonPrev.style.display = "block";
}

function hideButtonPrevBrand() {
    var buttonPrev = document.getElementById("button-prev-brand");
    buttonPrev.style.display = "none";
}

function changeImage() {
    var cboImg = document.getElementById("cboImg");
    var str = cboImg.options[cboImg.selectedIndex].value;
    var element = str.split(",",2);
    var imgURL = element[1];
    var imgFrame = document.getElementById("img-thumbnail-frame");
    imgFrame.src = "./images/products/"+imgURL;
}