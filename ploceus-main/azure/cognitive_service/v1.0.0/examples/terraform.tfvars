#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg000001"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}


#COGNITIVE ACCOUNT
cognitive_account = {
  "service1" = {
    name                    = "ploceuscognitive000001"
    resource_group_name     = "ploceusrg000001"
    resource_group_location = "westus2"
    sku_name                = "S0"   #F0, F1, S, S0, S1, S2, S3, S4, S5, S6, P0, P1, and P2
    kind                    = "Face" # Academic, AnomalyDetector, Bing.Autosuggest, Bing.Autosuggest.v7, Bing.CustomSearch, Bing.Search, Bing.Search.v7, Bing.Speech, Bing.SpellCheck, Bing.SpellCheck.v7, CognitiveServices, ComputerVision, ContentModerator, CustomSpeech, CustomVision.Prediction, CustomVision.Training, Emotion, Face,FormRecognizer, ImmersiveReader, LUIS, LUIS.Authoring, Personalizer, QnAMaker, Recommendations, SpeakerRecognition, Speech, SpeechServices, SpeechTranslation, TextAnalytics, TextTranslation and WebLM


  }
}
