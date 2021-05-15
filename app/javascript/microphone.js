function microphone (){
  SpeechRecognition = webkitSpeechRecognition || SpeechRecognition;
  const speech = new webkitSpeechRecognition();
  speech.lang = 'ja-JP';

  const micBtn = document.getElementById("microphone");
  const inputBox = document.getElementById("input-box");

  micBtn.addEventListener('click' , function() {
    speech.start();
  });

  speech.addEventListener('result' , function(e) {
    console.log(e);
    const text = e.results[0][0].transcript;
    document.forms.search_form.input_box.value = text;
  });
}

window.addEventListener("load", microphone); 