document.addEventListener("DOMContentLoaded", function () {
  const qas = document.querySelectorAll(".qa");
  qas.forEach((qa) => {
    qa.addEventListener("click", function () {
      qa.classList.toggle("opne");
    });
  });
});
