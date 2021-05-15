function link (){
  const aveScore = document.getElementById("ave_score_a");
  const companyURL = document.getElementById("company_url_a");

  aveScore.addEventListener("mouseover",function(){
    aveScore.setAttribute("style", "color: #ffaf60;");
  });
  aveScore.addEventListener("mouseout",function(){
    aveScore.removeAttribute("style", "color: #ffaf60;");
  });

  companyURL.addEventListener("mouseover",function(){
    companyURL.setAttribute("style", "color: #ffaf60;");
  });
  companyURL.addEventListener("mouseout",function(){
    companyURL.removeAttribute("style", "color: #ffaf60;");
  });

}

window.addEventListener("load", link); 