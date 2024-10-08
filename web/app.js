
const slideShow = document.getElementById('slideshow');
const slides = slideShow.getElementsByTagName('video');

var index = 0;

function nextSlide() {
    slides[index].classList.remove('active');
    index = (index + 1) % slides.length;
    slides[index].classList.add('active');
}

function prevSlide() {
    slides[index].classList.remove('active');
    index = (index - 1 + slides.length) % slides.length;
    slides[index].classList.add('active');
}

const slideshowText = document.getElementById('slideshowText');
const slidesText = slideshowText.getElementsByTagName('div');

var i = 0;

function nextSlideText() {
    slidesText[i].classList.remove('active');
    i = (i + 1) % slidesText.length;
    slidesText[i].classList.add('active');
}

function prevSlideText() {
    slidesText[i].classList.remove('active');
    i = (i - 1 + slidesText.length) % slidesText.length;
    slidesText[i].classList.add('active');
}

function toggleMenu() {
    const menuIcon = document.querySelector('.menuIcon');
    const navbar = document.getElementById('navbar');
    menuIcon.classList.toggle('active');
    navbar.classList.toggle('active');
}

//sticky nav
window.addEventListener("scroll", function () {
    var header = this.document.querySelector('header');
    header.classList.toggle('sticky', window.scrollY > 0);
});