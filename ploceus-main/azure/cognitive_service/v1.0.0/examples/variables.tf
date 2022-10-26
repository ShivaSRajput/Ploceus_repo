#RESOURCE GROUP VARIABLES
variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}

#COGNITIVE ACCOUNT VARIABLE
variable "cognitive_account" {
  type = map(object({
    name                    = string
    resource_group_name     = string
    resource_group_location = string
    sku_name                = string #F0, F1, S, S0, S1, S2, S3, S4, S5, S6, P0, P1, and P2
    kind                    = string # Academic, AnomalyDetector, Bing.Autosuggest, Bing.Autosuggest.v7, Bing.CustomSearch, Bing.Search, Bing.Search.v7, Bing.Speech, Bing.SpellCheck, Bing.SpellCheck.v7, CognitiveServices, ComputerVision, ContentModerator, CustomSpeech, CustomVision.Prediction, CustomVision.Training, Emotion, Face,FormRecognizer, ImmersiveReader, LUIS, LUIS.Authoring, Personalizer, QnAMaker, Recommendations, SpeakerRecognition, Speech, SpeechServices, SpeechTranslation, TextAnalytics, TextTranslation and WebLM


  }))
  description = "Map containing cognitive_account information"
  default = {
  }
}
