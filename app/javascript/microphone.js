function microphone (){
  SpeechRecognition = webkitSpeechRecognition || SpeechRecognition;
  const speech = new webkitSpeechRecognition();
  speech.lang = 'ja-JP';

  const micBtn = document.getElementById("microphone");
  const inputBox = document.getElementById("input-box");

  micBtn.addEventListener('click' , function() {
    const searchBar = document.getElementById("search-bar")
    const html = `
    <div class="temporary-search-bar", id="temporary-search-bar">
      <i class="fas fa-microphone">  音声を認識しています.....</i>
    </div>`;
    searchBar.insertAdjacentHTML("beforeend",html);
    speech.start();
  });

  speech.addEventListener('result' , function(e) {
    console.log(e);
    const text = e.results[0][0].transcript;
    document.forms.search_form.input_box.value = text;
    const searchBtn = document.getElementById("search-btn")
    searchBtn.click();
  });

  speech.addEventListener('error' , function() {
    const insertBar = document.getElementById("temporary-search-bar")
    insertBar.remove();
  });

}

window.addEventListener("load", microphone); 